//
//  RegistrationVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/21/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools
import JGProgressHUD

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
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
        let tf = CustomTextField(placeholder: "First name …", textColor: .carolinaBlue)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let lastNameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Last name …", textColor: .carolinaBlue)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let divider = UIView(backgroundColor: .carolinaBlue)
    
    fileprivate let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "UNC email …", textColor: .carolinaBlue)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    fileprivate let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password … (8+ characters)", textColor: .carolinaBlue)
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
        b.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate let backToLoginButton: UIButton = {
        let b = UIButton(title: "Back to Login", titleColor: .white, font: .systemFont(ofSize: 16, weight: .semibold))
        b.addTarget(self, action: #selector(backToLoginTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, firstNameTextField, lastNameTextField, divider, emailTextField, passwordTextField, signUpButton, backToLoginButton])
    
    // MARK: - Properties
    let auth = AuthService.shared
    let firestore = FirestoreService.shared
    var registrationChecker = RegistrationChecker()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        setupRegistrationChecker()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Selectors
    
    @objc fileprivate func signUpTapped() {
        
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text
        else { return }
        
        let hud = JGProgressHUD(style: .dark, text: "Signing up")
        hud.show(in: self.view)
        
        auth.signUp(withEmail: email, password: password) { [unowned self] (result, error) in
            
            if let err = error {
                hud.dismiss()
                let alert = UIAlertController(title: "Sign up failed", message: err.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true)
            } else {
                let user = result?.user
                let userId = user?.uid ?? UUID().uuidString
                
                var newUser = User(id: userId, firstName: firstName, lastName: lastName, email: email, age: nil, hometown: nil, profilePicURL: nil, interests: nil)
                self.firestore.createUser(user: newUser)
                
                let changeRequest = user?.createProfileChangeRequest()
                changeRequest?.displayName = newUser.displayName
                
                changeRequest?.commitChanges(completion: nil)
                
                hud.dismiss()
                self.dismiss(animated: true)
            }
        }
    }
    
    @objc fileprivate func backToLoginTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func handleTextChange() {
        registrationChecker.firstName = firstNameTextField.text
        registrationChecker.lastName = lastNameTextField.text
        registrationChecker.email = emailTextField.text
        registrationChecker.password = passwordTextField.text
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        title = "Sign Up"
        
        view.backgroundColor = .darkGray
    }
    
    fileprivate func setupLayout() {
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(56, after: textLabel)
        stackView.setCustomSpacing(8, after: firstNameTextField)
        stackView.setCustomSpacing(8, after: emailTextField)
        stackView.setCustomSpacing(24, after: passwordTextField)
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        stackView.centerYToSuperview()
        
        divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    fileprivate func setupRegistrationChecker() {
        registrationChecker.observer = { [unowned self] (isValid) in
            self.signUpButton.isEnabled = isValid
            self.signUpButton.backgroundColor = isValid ? .carolinaBlue : .lightGray
        }
    }
    
}
