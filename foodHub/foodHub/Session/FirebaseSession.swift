//
//  FirebaseSession.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 7/29/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession() // singleton

class FirebaseSession: ObservableObject {
    @Published var foodies = [FoodieUser]()
    @Published var eaters = [EaterUser]()
    let db = Firestore.firestore()
    
    init() {
        readData()
    }
    
    func readData() {
        db.collection("foodies").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New foodie: \(diff.document.data())")
                    let foodie = FoodieUser(id: diff.document.documentID,
                                            name: diff.document.get("name") as! String,
                                            address: diff.document.get("address") as! String,
                                            email: diff.document.get("email") as! String,
                                            isActive: diff.document.get("isActive") as! Bool,
                                            zipCode: diff.document.get("zipCode") as! String,
                                            city: diff.document.get("city") as! String,
                                            state: diff.document.get("state") as! String)
                }
                
                /*
                 self.name = name
                 self.address = address
                 self.email = email
                 self.isActive = true
                 self.zipCode = zipCode
                 self.city = city
                 self.state = state
                 */
            }
        }
        
        
        db.collection("eaters").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New eater: \(diff.document.data())")
                }
                
            }
        }
    }
}
