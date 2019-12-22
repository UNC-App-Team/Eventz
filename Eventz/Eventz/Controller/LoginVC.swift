//
//  LoginViewController.swift
//  Eventz
//
//  Created by Beliz Yilmaz on 11/6/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import FirebaseAuth
import LBTATools
import JGProgressHUD

class LoginViewController: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate let titleLabel: UILabel = {
        let labelText = NSMutableAttributedString()
        let firstString = NSMutableAttributedString(string: "Welcome to\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 32, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        let secondString = NSMutableAttributedString(string: "Eventz", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 64, weight: .heavy),
        NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let l = UILabel()
        labelText.append(firstString)
        labelText.append(secondString)
        
        l.attributedText = labelText
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    fileprivate let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email …", textColor: .carolinaBlue)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()

    fileprivate let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password …", textColor: .carolinaBlue)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()

    fileprivate let forgotPassWordButton: UIButton = {
        let b = UIButton(title: "Forgot Password?", titleColor: .white, font: .systemFont(ofSize: 16, weight: .semibold))
        b.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return b
    }()

    fileprivate let signInButton: UIButton = {
        let b = UIButton(title: "Sign in", titleColor: .white, font: .systemFont(ofSize: 20, weight: .bold), backgroundColor: UIColor.carolinaBlue)
        b.heightAnchor.constraint(equalToConstant: 44).isActive = true
        b.layer.cornerRadius = 22
        b.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return b
    }()

    fileprivate let signUpButton: UIButton = {
        let b = UIButton()
        
        let labelString = NSMutableAttributedString(string: "No account yet?  ", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        
        labelString.append(NSMutableAttributedString(string: "Register.", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold),
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue,
        NSAttributedString.Key.underlineColor : UIColor.carolinaBlue]))
        
        b.setAttributedTitle(labelString, for: .normal)
        
        b.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, emailTextField, passwordTextField, forgotPassWordButton, signInButton, signUpButton])
    
    let firestore = FirestoreService.shared
    let auth = AuthService.shared
//    let openingForTheFirstTime = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        setupNotificationObservers()
    }
    
    // MARK: - Selectors
    
    @objc func forgotPasswordTapped() {
        
        if let email = emailTextField.text , emailTextField.text != "" {
            auth.forgotPassword(forEmail: email)
            let alert = UIAlertController(title: "Password Reset Request", message: "Check your inbox for an email with instructions on how to reset your password.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Password Reset Request", message: "You must enter an email address to request a password reset.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    @objc func signInTapped() {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Signing in"
        hud.show(in: self.view)
        
        auth.signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (result, error) in
            if let err = error {
                hud.dismiss()
                let alert = UIAlertController(title: "Sign in failed", message: err.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true)
            } else {
                hud.dismiss()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func signUpTapped() {
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true)
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue
        
        // Calculate distance from botton of signUpButton to bottom of the screen
        let bottomspace = view.frame.height - stackView.frame.origin.y - stackView.frame.height
        
        let difference = keyboardFrame.height - bottomspace
        if difference > 0 {
            view.transform = CGAffineTransform(translationX: 0, y: -difference - 12)
        }
    }
    
    @objc fileprivate func handleKeyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
        })
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .darkGray
    }
    
    fileprivate func setupLayout() {
        
        stackView.axis = .vertical
        
        stackView.spacing = 16
        stackView.setCustomSpacing(32, after: titleLabel)
        stackView.setCustomSpacing(8, after: emailTextField)
        stackView.setCustomSpacing(6, after: passwordTextField)
        stackView.setCustomSpacing(24, after: forgotPassWordButton)
        
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        stackView.centerYToSuperview()
    }
    
    fileprivate func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    // MARK: - Helper Functions
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
}
