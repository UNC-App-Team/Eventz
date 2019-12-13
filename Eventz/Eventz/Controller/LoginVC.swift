//
//  LoginViewController.swift
//  Eventz
//
//  Created by Beliz Yilmaz on 11/6/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation
import LBTATools

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate let backgroundImage: UIImageView = {
        let v = UIImageView(image: #imageLiteral(resourceName: "oldWell"))
        v.alpha = 0.5
        v.contentMode = .top
        return v
    }()
    
    fileprivate let loginLabel: UILabel = {
        let labelText = NSMutableAttributedString()
        let firstString = NSMutableAttributedString(string: "Welcome to\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        let secondString = NSMutableAttributedString(string: "Eventz", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 68, weight: .heavy),
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
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : CAROLINA_BLUE, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
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
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : CAROLINA_BLUE, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.layer.cornerRadius = 16
        tf.addLeftInset(height: 44)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    fileprivate let forgotPassWordButton: UIButton = {
        let b = UIButton(title: "Forgot Password?", titleColor: .white, font: .systemFont(ofSize: 18, weight: .semibold))
        return b
    }()
    
    fileprivate let loginButton: UIButton = {
        let b = UIButton(title: "Log in", titleColor: .white, font: .systemFont(ofSize: 20, weight: .bold), backgroundColor: CAROLINA_BLUE, target: self, action: nil)
        b.layer.cornerRadius = 16
        b.addTarget(self, action: #selector(showHomeViewController), for: .touchUpInside)
        return b
    }()
    
    fileprivate let signupButton: UIButton = {
        let b = UIButton(title: "Sign up", titleColor: CAROLINA_BLUE, font: .systemFont(ofSize: 20, weight: .semibold), backgroundColor: .white, target: self, action: nil)
        b.layer.cornerRadius = 16
        return b
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    func setupUI() {
        view.backgroundColor = .darkGray
    }
    
    func setupLayout() {
        
        view.addSubview(backgroundImage)
        backgroundImage.fillSuperview()
        
        view.addSubview(loginLabel)
        loginLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 120, left: 24, bottom: 0, right: 24))
        
        view.addSubview(emailTextField)
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.anchor(top: loginLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 96, left: 24, bottom: 0, right: 24))
        
        view.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 24, bottom: 0, right: 24))
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(forgotPassWordButton)
        forgotPassWordButton.anchor(top: passwordTextField.bottomAnchor, leading: nil, bottom: nil, trailing: passwordTextField.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 8))
        
        let buttonStackView = UIStackView(arrangedSubviews: [signupButton, loginButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 12
        
        view.addSubview(buttonStackView)
        
        buttonStackView.anchor(top: forgotPassWordButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 24, bottom: 0, right: 24))
        buttonStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    // MARK: - Selectors
    
    @objc func showHomeViewController() {
        dismiss(animated: true)
    }
    
    // MARK: - Helper Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


