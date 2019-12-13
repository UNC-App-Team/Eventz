//
//  HomeVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/8/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools

let eventCellIdentifier = "eventCell"

class HomeViewController: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate let tableView: UITableView = {
        let tv = UITableView()
        tv.allowsSelection = false
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.register(EventCell.self, forCellReuseIdentifier: eventCellIdentifier)
        return tv
    }()
    
    // MARK: - Properties
    
    var events = [
        Event(title: "Bowling", category: "let's roll", description: "", date: Date(), location: "Fetzer Gym", imageURL: "bowling")
    ]
    
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
        title = "Feed"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    fileprivate func setupLayout() {
        view.addSubview(tableView)
               tableView.fillSuperview()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: eventCellIdentifier, for: indexPath) as? EventCell else { return UITableViewCell() }
        
        cell.configure(event: events[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
