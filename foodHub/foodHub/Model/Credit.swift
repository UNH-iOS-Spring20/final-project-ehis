//
//  Credit.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

class Credit: FirebaseCodable {
    var id: String
    @Published var name: String
    @Published var description: String
    @Published var date: Timestamp
    
    var data: [String: Any] {
        return [
            "name": name,
            "description": description,
            "date": date
        ]
    }
    
    required init? (id: String, data: [String: Any]) {
        guard let name = data["name"] as? String,
            let description = data["description"] as? String,
            let date = data["date"] as? Timestamp
            
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
        self.date = date
    }
}
