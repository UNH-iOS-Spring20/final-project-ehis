//
//  FoodieUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
import FirebaseFirestore
//import CoreLocation

class FoodieUser: FirebaseCodable{
    // using @Published on fields that get shown to the user in the app
    var id: String
    @Published var name: String
    @Published var address: String
    @Published var email: String
    @Published var phone: String
    @Published var isActive: Bool
    @Published var zipCode: String
    @Published var city: String
    @Published var state: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "address": address,
            "email": email,
            "phone": phone,
            "isActive": isActive,
            "zipCode": zipCode,
            "city": city,
            "state": state
        ]
    }
    
    required init? (id: String, data: [String: Any]) {
        guard let name = data["name"] as? String,
            let address = data["address"] as? String,
            let email = data["email"] as? String,
            let phone = data["phone"] as? String,
            let isActive = data["isActive"] as? Bool,
            let zipCode = data["zipCode"] as? String,
            let city = data["city"] as? String,
            let state = data["state"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.isActive = isActive
        self.zipCode = zipCode
        self.city = city
        self.state = state
    }
    
    
    //    fileprivate var coordinates: Coordinates
    
    /*   var locationCoordinate: CLLocationCoordinate2D {
     CLLocationCoordinate2D(
     latitude: coordinates.latitude,
     longitude: coordinates.longitude)
     }
     */
}


/*
 struct Coordinates: Hashable, Codable {
 var latitude: Double
 var longitude: Double
 }
 */
