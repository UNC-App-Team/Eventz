//
//  FirestoreService.swift
//  Eventz
//
//  Created by Max Nabokow on 12/18/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

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
                    
                    let event = Event(title: title, category: category, description: description, date: Date(), location: "location", imageURL: imageURL)
                    events.append(event)
                }
                
                completion(events)
                
            }
        }
    }
    
//    func createArticle(_ article: Article) {
//
//        guard
//            let articleTitle = article.title,
//            let articleSource = article.source
//            else { return }
//
//
//        articles.document(articleTitle + articleSource).setData([
//            "title" : article.title ?? "",
//            "description" : article.description ?? "",
//            "source" : article.source ?? "",
//            "url" : article.url ?? "",
//            "numReviews" : 0
//        ])
//    }
//
//    func createReview(for article: Article, review: Review) {
//        guard
//            let articleTitle = article.title,
//            let articleSource = article.source
//            else { return }
//
//        // create review document
//        articles.document(articleTitle + articleSource).collection("Reviews").addDocument(data: [
//            "userId" : Auth.auth().currentUser?.uid ?? "",
//            "comment" : review.comment ?? "",
//            "rating" : review.rating
//        ])
//
//        // update article document
//        articles.document(articleTitle + articleSource).updateData([
//            "totalRating" : FieldValue.increment(Int64(review.rating)),
//            "numReviews" : FieldValue.increment(Int64(1))
//        ])
//    }
//
//    func checkUnique(_ article: Article, completion: @escaping (Bool) -> Void) {
//
//        if let articleTitle = article.title,
//            let articleSource = article.source {
//
//            print(articles.document(articleTitle + articleSource))
//
//            let query = articles.whereField("title", isEqualTo: articleTitle).whereField("source", isEqualTo: articleSource)
//
//            query.getDocuments { (snapshot, err) in
//                guard let snapshot = snapshot else { return }
//                print(snapshot.documents.count)
//                if snapshot.documents.count == 0 {
//                    completion(true)
//                }
//            }
//            completion(false)
//        }
//    }
}
