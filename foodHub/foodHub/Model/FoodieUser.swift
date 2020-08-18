//
//  FoodieUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
import FirebaseFirestore
//import CoreLocation

struct FoodieUser: Identifiable{
    var id: String
    var name: String
    var address: String
    var email: String
    var phone: String
    var isActive: Bool
    var zipCode: String
    var city: String
    var state: String
    var menu = [String]()
//    fileprivate var coordinates: Coordinates
    
 /*   var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
 */
    init? (_ name: String, _ address: String, _ email: String, _ phone: String, _ zipCode: String, _ city: String, _ state: String){
        if name.isEmpty || zipCode.isEmpty {
            return nil
        }
        else {
            self.id = name + "-" + zipCode
            self.name = name
            self.address = address
            self.email = email
            self.phone = phone
            self.isActive = true
            self.zipCode = zipCode
            self.city = city
            self.state = state
        }
    }
    init? (allFields id: String, name: String, address: String, email: String, phone: String, isActive: Bool, zipCode: String, city: String, state: String, menu: [String]){
        if name.isEmpty || zipCode.isEmpty {
            return nil
        }
        else {
            self.id = id
            self.name = name
            self.address = address
            self.email = email
            self.phone = phone
            self.isActive = isActive
            self.zipCode = zipCode
            self.city = city
            self.state = state
            self.menu = menu;
        }
    }
}

extension FoodieUser: DocumentSerializable {
    init? (id: String, dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let address = dictionary["address"] as? String,
            let email = dictionary["email"] as? String,
            let phone = dictionary["phone"] as? String,
            let isActive = dictionary["isActive"] as? Bool,
            let zipCode = dictionary["zipCode"] as? String,
            let city = dictionary["city"] as? String,
            let state = dictionary["state"] as? String,
            let menu = dictionary["menu"] as? [String]
        else {
            return nil
        }
        
        self.init(allFields: id, name: name, address: address, email: email, phone: phone, isActive: isActive, zipCode: zipCode, city: city, state: state, menu: menu)
    }
    
}

/*
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
*/
