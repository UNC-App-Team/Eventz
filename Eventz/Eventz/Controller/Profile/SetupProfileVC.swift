//
//  SetupProfileVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/25/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    // MARK: - UI Elements
       
    fileprivate let profilePhotoImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Screen Shot 2019-12-31 at 7.22.35 PM.png"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        return image
    }()
       
    fileprivate let hometownTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Hometown", textColor: .carolinaBlue)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        return tf
    }()
    
    fileprivate let graduationYearTextField: UITextField = {
           let tf = CustomTextField(placeholder: "Graduation Year", textColor: .carolinaBlue)
           tf.autocorrectionType = .no
           tf.autocapitalizationType = .words
           return tf
       }()
    
    fileprivate let ageTextField: UITextField = {
           let tf = CustomTextField(placeholder: "Age", textColor: .carolinaBlue)
           tf.autocorrectionType = .no
           tf.autocapitalizationType = .words
           return tf
       }()
    
    fileprivate let majorsTextField: UITextField = {
           let tf = CustomTextField(placeholder: "Major(s)", textColor: .carolinaBlue)
           tf.autocorrectionType = .no
           tf.autocapitalizationType = .words
           return tf
       }()
    
    fileprivate let minorsTextField: UITextField = {
           let tf = CustomTextField(placeholder: "Minor(s)", textColor: .carolinaBlue)
           tf.autocorrectionType = .no
           tf.autocapitalizationType = .words
           return tf
       }()
    
    fileprivate let continueButton: UIButton = {
           let b = UIButton(title: "Continue", titleColor: .white, font: .systemFont(ofSize: 20, weight: .heavy), backgroundColor: UIColor.carolinaBlue, target: self, action: nil)
           b.isEnabled = false
           b.backgroundColor = .carolinaBlue
           b.setTitleColor(.white, for: .disabled)
           b.heightAnchor.constraint(equalToConstant: 50).isActive = true
           b.layer.cornerRadius = 25
           return b
       }()
    
    fileprivate lazy var stackView = UIStackView(arrangedSubviews: [hometownTextField, graduationYearTextField, ageTextField, majorsTextField, minorsTextField, continueButton])
      
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        setupUI()
        setupLayout()

    }
    
    override func viewDidLayoutSubviews() {
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.height / 2
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .lightGray
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(profilePhotoImageView)
    profilePhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
    profilePhotoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
    profilePhotoImageView.widthAnchor.constraint(equalTo: profilePhotoImageView.heightAnchor).isActive = true
        
        profilePhotoImageView.centerXToSuperview()
        
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        stackView.centerYToSuperview()
        
    }
    
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    
}
