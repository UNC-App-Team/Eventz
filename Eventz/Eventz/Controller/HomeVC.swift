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
    
    fileprivate let noEventsLabel: UILabel = {
        let l = UILabel()
        l.text = "No Events here"
        l.numberOfLines = 0
        l.textAlignment = .center
        l.textColor = .darkGray
        return l
    }()
    
    fileprivate let tableView: UITableView = {
        let tv = UITableView()
        tv.allowsSelection = false
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.register(EventCell.self, forCellReuseIdentifier: eventCellIdentifier)
        return tv
    }()
    
    // MARK: - Properties
    
    var events: [Event] = [
        Event(title: "Bowling", category: "Sports", description: "", date: Date(), location: "Fetzer Gym", imageURL: "bowling"),
        Event(title: "Concert", category: "Music", description: "", date: Date(), location: "Great Hall", imageURL: "concert")
    ]
    
    var loggedIn = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        if (!loggedIn) {
            
           let welcomeVC: UICollectionViewController = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                let vc = WelcomeViewController(collectionViewLayout: layout)
                vc.modalPresentationStyle = .fullScreen
                return vc
            }()
            
            present(welcomeVC, animated: false)
        }
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        title = "Feed"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    fileprivate func setupLayout() {
        
        if (events.isEmpty) {
            view.addSubview(noEventsLabel)
            noEventsLabel.centerInSuperview()
        } else {
            view.addSubview(tableView)
            tableView.fillSuperview()
            
        }
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
