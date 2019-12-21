//
//  FirestoreService.swift
//  Eventz
//
//  Created by Max Nabokow on 12/18/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import FirebaseFirestore

class FirestoreService {
    
    private init() {}
    
    let eventsRef = Firestore.firestore().collection("events")
    let usersRed = Firestore.firestore().collection("users")
    
    static let shared = FirestoreService()
    
    func fetchEvents(completion: @escaping ([Event]) -> Void) {
        
        eventsRef.addSnapshotListener { (snapshot, err) in
            if err == nil {
                
                guard let documents = snapshot?.documents else { return }
                
                var events = [Event]()
                
                for document in documents {
                    
                    let id = document.documentID
                    
                    let title = document["title"] as? String ?? ""
                    let category = document["category"] as? String ?? ""
                    
                    let description = document["description"] as? String ?? ""
                    let imageURL = document["imageURL"] as? String ?? ""
                    
                    let organizerId = document["organizerId"] as? String ?? ""
                    
                    let event = Event(id: id, title: title, category: category, description: description, date: Date(), location: "location", imageURL: imageURL, organizerId: organizerId)
                    
                    events.append(event)
                }
                
                completion(events)
            }
        }
    }
    
    func fetchEvents(withFilter filter: (key: String, value: Any), completion: @escaping ([Event]) -> Void) {
        
        eventsRef.whereField(filter.key, isEqualTo: filter.value).getDocuments { (snapshot, err) in
            if err == nil {
                
                guard let documents = snapshot?.documents else { return }
                
                var events = [Event]()
                
                for document in documents {
                    
                    let id = document.documentID
                    
                    let title = document["title"] as? String ?? ""
                    let category = document["category"] as? String ?? ""
                    
                    let description = document["description"] as? String ?? ""
                    let imageURL = document["imageURL"] as? String ?? ""
                    
                    let organizerId = document["organizerId"] as? String ?? ""
                    
                    let event = Event(id: id, title: title, category: category, description: description, date: Date(), location: "location", imageURL: imageURL, organizerId: organizerId)
                    
                    events.append(event)
                }
                
                completion(events)
            }
        }
    }
    
    func createEvent(event: Event) {
        
        eventsRef.addDocument(data: [
            "id" : event.id,
            "title" : event.title,
            "category" : event.category,
            "description" : event.description ?? "",
            "imageURL" : event.imageURL ?? "",
            "organizerId" : AuthService.shared.getCurrentUserId() ?? ""
        ])
    }
}
