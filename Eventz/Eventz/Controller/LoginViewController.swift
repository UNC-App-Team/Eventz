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
    
    let backgroundImage: UIImageView = {
        let v = UIImageView(image: #imageLiteral(resourceName: "oldWell"))
        v.alpha = 0.5
        v.contentMode = .top
        return v
    }()
    
    let loginLabel: UILabel = {
        let l = UILabel(text: "Login", font: .systemFont(ofSize: 44, weight: .heavy), textColor: .white, textAlignment: .center, numberOfLines: 1)
        return l
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : CAROLINA_BLUE, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 16
        tf.addLeftInset(height: 44)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : CAROLINA_BLUE, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 16
        tf.addLeftInset(height: 44)
        return tf
    }()
    
    let loginButton: UIButton = {
        let b = UIButton(title: "Log in", titleColor: .white, font: .systemFont(ofSize: 20, weight: .bold), backgroundColor: CAROLINA_BLUE, target: self, action: nil)
        b.layer.cornerRadius = 16
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        view.backgroundColor = .darkGray
        
        
        view.addSubview(backgroundImage)
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func setupLayout() {
        
        backgroundImage.fillSuperview()
        
        loginLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 120, left: 24, bottom: 0, right: 24))
        
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.anchor(top: loginLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 120, left: 24, bottom: 0, right: 24))
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passwordTextField.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 24, bottom: 0, right: 24))
        
        loginButton.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 24, bottom: 0, right: 24))
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
}


