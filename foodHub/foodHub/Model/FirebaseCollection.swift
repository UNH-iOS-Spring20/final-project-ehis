//
//  FirebaseCollection.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/9/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

protocol FirebaseCodable: Identifiable, ObservableObject {
    init?(id: String, data: [String: Any])
}

class FirebaseCollection<T: FirebaseCodable>: ObservableObject {
    // private(set) gives external readability, but no modify access
    @Published private(set) var items: [T]
    
    init(collectionRef: CollectionReference){
        self.items = []
        listenForChanges(collectionRef: collectionRef)
    }
    
    func listenForChanges(collectionRef: CollectionReference){
        collectionRef.addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error fetching snapshots: \(error)")
                return
            }
            
            let models = snapshot.documents.map { (document) -> T in
                if let model = T(id: document.documentID, data: document.data()) {
                    return model
                }
                else {
                    fatalError("Unable to initialize type \(T.self) with dictionary \(document.data())")
                }
            }
            self.items = models
        }
    }
}
