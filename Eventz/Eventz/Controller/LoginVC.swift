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
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.carolinaBlue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.layer.cornerRadius = 16
        tf.addLeftInset(height: 44)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()

    fileprivate let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.carolinaBlue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.layer.cornerRadius = 16
        tf.addLeftInset(height: 44)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()

    fileprivate let forgotPassWordButton: UIButton = {
        let b = UIButton(title: "Forgot Password?", titleColor: .white, font: .systemFont(ofSize: 16, weight: .semibold))
        b.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return b
    }()

    fileprivate let loginButton: UIButton = {
        let b = UIButton(title: "Sign in", titleColor: .white, font: .systemFont(ofSize: 20, weight: .bold), backgroundColor: UIColor.carolinaBlue, target: self, action: nil)
        b.layer.cornerRadius = 22
        b.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return b
    }()

    fileprivate let signupButton: UIButton = {
        let b = UIButton()
        
        let labelString = NSMutableAttributedString(string: "No account yet?   ", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .regular),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        
        labelString.append(NSMutableAttributedString(string: "Sign up.", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .heavy),
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue,
        NSAttributedString.Key.underlineColor : UIColor.carolinaBlue]))
        
        b.setAttributedTitle(labelString, for: .normal)
        
        b.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return b
    }()
    
    let firebase = FirestoreService.shared
    let auth = AuthService.shared
    let openingForTheFirstTime = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
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
        print("Sign up tapped")
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true)
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .darkGray
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        let centerStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, forgotPassWordButton])
        centerStackView.axis = .vertical
        centerStackView.spacing = 12
        centerStackView.setCustomSpacing(6, after: passwordTextField)
        emailTextField.heightAnchor.constraint(equalToConstant: 52).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
        view.addSubview(centerStackView)
        centerStackView.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        let bottomStackView = UIStackView(arrangedSubviews: [loginButton, signupButton])
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 12
        bottomStackView.distribution = .fillEqually
        
        loginButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        signupButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
        
        view.addSubview(bottomStackView)
        bottomStackView.anchor(top: centerStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 48, left: 16, bottom: 0, right: 16))
    }
    
    // MARK: - Helper Functions
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
}
