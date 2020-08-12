//
//  FirebaseCollection.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/9/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

protocol DocumentSerializable {
    init?(id: String, dictionary: [String: Any])
}

class FirebaseCollection<T: DocumentSerializable>: ObservableObject {
    // private(set) gives external readability, but no modify access
    @Published private(set) var items: [T]
    let query: Query
    
    init(query: Query){
        self.items = []
        self.query = query
        listenForChanges()
    }
    
    func listenForChanges(){
        query.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error)")
                return
            }
            
            let models = snapshot.documents.map { (document) -> T in
                if let model = T(id: document.documentID, dictionary: document.data()) {
                    return model
                }
                else {
                    fatalError("Unable to initialize type \(T.self) with dictionary \(document.data())")
                }
            }
            self.items = models
        }
    }
    
    func deleteItem(index: Int){
        print("Deleting item: \(items[index])")
//        let id = self.items[index].id
//        query.document(id).delete() { err in
//            if let err = err {
//                print("Error removing document \(err)")
//            } else {
//                print("Successfully removed document")
//            }
//        }
    }
}
