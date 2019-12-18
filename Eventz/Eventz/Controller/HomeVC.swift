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
    
    // Label that displays when the table is empty
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
    
    // Dummy events, later we get this from Firestore
    var events: [Event] = [
        Event(title: "Bowling", category: "Sports", description: "", date: Date(), location: "Fetzer Gym", imageURL: "bowling"),
        Event(title: "Concert", category: "Music", description: "", date: Date(), location: "Great Hall", imageURL: "concert")
    ]
    
    // Dummy variable, later we get this from Firebase Authentication
    var loggedIn = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Present LoginVC if user is not logged in
        // The LoginVC presents Onboarding, if opening app for the first time
            // That doesn't quite work yet, so I am just presenting onboarding here for now
        if (!loggedIn) {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let welcomeVC = WelcomeViewController(collectionViewLayout: layout)
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: false, completion: nil)
        }
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        roundCorners()
        view.backgroundColor = .white
        title = "Feed"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    fileprivate func setupLayout() {
        
        // Display noEventsLabel if no events in feed
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
