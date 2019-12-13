//
//  HomeVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/8/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        return tv
    }()
    
    var loggedIn = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        if (!loggedIn) {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .green
        title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
    fileprivate func setupLayout() {
        view.addSubview(tableView)
               tableView.fillSuperview()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EventCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
