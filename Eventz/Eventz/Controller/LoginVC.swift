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
    
    // MARK: - UI Elements
    
    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Login"
        l.textColor = .white
        l.font = .systemFont(ofSize: 64, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        return l
    }()
    
    fileprivate let emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.carolinaBlue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
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
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.carolinaBlue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
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
        let b = UIButton(title: "Log in", titleColor: .white, font: .systemFont(ofSize: 20, weight: .bold), backgroundColor: UIColor.carolinaBlue, target: self, action: nil)
        b.layer.cornerRadius = 16
        b.addTarget(self, action: #selector(showHomeViewController), for: .touchUpInside)
        return b
    }()

    fileprivate let signupButton: UIButton = {
        let b = UIButton(title: "No account yet? Sign up.", titleColor: UIColor.carolinaBlue, font: .systemFont(ofSize: 20, weight: .semibold), backgroundColor: .white, target: self, action: nil)
        b.layer.cornerRadius = 16
        return b
    }()
    
    
    let openingForTheFirstTime = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        
        // Doesn't work, can't present on a presented VC :(
        if !openingForTheFirstTime {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            let welcomeVC = WelcomeViewController(collectionViewLayout: layout)
//            welcomeVC.modalPresentationStyle = .fullScreen
//            navigationController?.present(welcomeVC, animated: false, completion: nil)
        }
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .darkGray
    }
    
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [titleLabel, emailTextField, passwordTextField, forgotPassWordButton, loginButton, signupButton])
        overallStackView.axis = .vertical
        overallStackView.distribution = .fillProportionally
        overallStackView.spacing = 16
        view.addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
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


