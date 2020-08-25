//
//  EaterUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
import FirebaseFirestore

class EaterUser: FirebaseCodable{
    var id: String
    @Published var name: String
    @Published var email: String
    @Published var isActive: Bool
    @Published var isAdmin: Bool
    @Published var zipCode: String
    @Published var photo: String
    @Published var favorites: [String]
    
    var data: [String: Any] {
        return [
            "name": name,
            "email": email,
            "isActive": isActive,
            "isAdmin": isAdmin,
            "zipCode": zipCode,
            "photo": photo,
            "favorites": favorites
        ]
    }
    
    required init? (id: String, data: [String: Any]) {
        guard let name = data["name"] as? String,
            let email = data["email"] as? String,
            let isActive = data["isActive"] as? Bool,
            let isAdmin = data["isAdmin"] as? Bool,
            let zipCode = data["zipCode"] as? String
            
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.email = email
        self.isActive = isActive
        self.isAdmin = isAdmin
        self.zipCode = zipCode
        self.photo = data["photo"] as? String ?? defaultPhoto
        self.favorites = data["favorites"] as? [String] ?? [String]()
    }
    
    #if DEBUG
    static let example = EaterUser(id: "1", data: [
        "name": "Test Eater",
        "email": "test@email.com",
        "isActive": true,
        "isAdmin": false,
        "zipCode": "00000"
    ])!
    #endif
}
