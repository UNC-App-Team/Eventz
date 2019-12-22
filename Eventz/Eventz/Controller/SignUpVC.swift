//
//  SignUpVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/21/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools
import JGProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Elements
    
    fileprivate let titleLabel: UILabel = {
        let l = UILabel(text: "Sign Up", font: .systemFont(ofSize: 52, weight: .bold), textColor: .white, textAlignment: .center, numberOfLines: 1)
        return l
    }()
    
    fileprivate let textLabel: UILabel = {
        let l = UILabel(text: "We're so glad you're \njoining the community!", font: .systemFont(ofSize: 20, weight: .regular), textColor: .white, textAlignment: .center, numberOfLines: 0)
        return l
    }()
    
    fileprivate let firstNameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "First name …", textColor: .carolinaBlue, padding: 16)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let lastNameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Last name …", textColor: .carolinaBlue, padding: 16)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let divider = UIView(backgroundColor: .carolinaBlue)
    
    fileprivate let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "UNC email …", textColor: .carolinaBlue, padding: 16)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password … (min. 8 characters)", textColor: .carolinaBlue, padding: 16)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let signUpButton: UIButton = {
        let b = UIButton(title: "Sign up", titleColor: .white, font: .systemFont(ofSize: 20, weight: .heavy), backgroundColor: UIColor.carolinaBlue, target: self, action: nil)
        b.isEnabled = false
        b.backgroundColor = .lightGray
        b.setTitleColor(.darkGray, for: .disabled)
        b.heightAnchor.constraint(equalToConstant: 50).isActive = true
        b.layer.cornerRadius = 25
        b.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, firstNameTextField, lastNameTextField, divider, emailTextField, passwordTextField, signUpButton])
    
    // MARK: - Properties
    let auth = AuthService.shared
    var registrationChecker = RegistrationChecker()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        setupNavBar()
        setupNotificationObservers()
        setupRegistrationChecker()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        title = "Sign Up"
        
        view.backgroundColor = .darkGray
    }
    
    fileprivate func setupLayout() {
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(16, after: titleLabel)
        stackView.setCustomSpacing(56, after: textLabel)
        stackView.setCustomSpacing(8, after: firstNameTextField)
        stackView.setCustomSpacing(8, after: emailTextField)
        stackView.setCustomSpacing(24, after: passwordTextField)
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        stackView.centerYToSuperview()
        
        divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    fileprivate func setupNavBar() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    fileprivate func setupRegistrationChecker() {
        registrationChecker.observer = { [unowned self] (isValid) in
            self.signUpButton.isEnabled = isValid
            self.signUpButton.backgroundColor = isValid ? .carolinaBlue : .lightGray
        }
    }
    
    fileprivate func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Selectors
    
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
    
    @objc fileprivate func continueTapped() {
        let hud = JGProgressHUD(style: .dark, text: "Signing up")
        hud.show(in: self.view)
        
        auth.signUp(withEmail: emailTextField.text!, password: passwordTextField.text!) { (_, error) in
            
            if let err = error {
                hud.dismiss()
                let alert = UIAlertController(title: "Sign up failed", message: err.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true)
            } else {
                hud.dismiss()
                self.dismiss(animated: true)
            }
        }
    }
    
    @objc fileprivate func handleTextChange() {
        registrationChecker.firstName = firstNameTextField.text
        registrationChecker.lastName = lastNameTextField.text
        registrationChecker.email = emailTextField.text
        registrationChecker.password = passwordTextField.text
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
}
