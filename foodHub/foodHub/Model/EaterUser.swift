//
//  EaterUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.

/*
struct EaterUser: Identifiable {
    var id: String
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var isAdmin: Bool
    var zipCode: String
}
*/

struct EaterUser: Identifiable{
    var id: String
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var isAdmin: Bool
    var zipCode: String
    
    init? (_ name: String, _ address: String, _ email: String, isAdmin: Bool, zipCode: String){
        if name.isEmpty || email.isEmpty {
            return nil
        }
        if isAdmin != true {
            self.isAdmin = false
        }
        else {
            self.isAdmin = true
        }
        self.id = email
        self.name = name
        self.address = address
        self.email = email
        self.isActive = true
        self.zipCode = zipCode
    }
    
    init? (allFields id: String, name: String, address: String, email: String, isActive: Bool, isAdmin: Bool, zipCode: String) {
        if name.isEmpty || email.isEmpty {
            return nil
        }
        else {
            self.id = id
            self.name = name
            self.address = address
            self.email = email
            self.isActive = isActive
            self.isAdmin = isAdmin
            self.zipCode = zipCode
        }
    }
}
 
extension EaterUser: DocumentSerializable {
    init? (id: String, dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let isActive = dictionary["isActive"] as? Bool,
            let isAdmin = dictionary["isAdmin"] as? Bool,
            let zipCode = dictionary["zipCode"] as? String
            
        else {
            return nil
        }
        

        let address = dictionary["address"] as! String? ?? ""
        
        self.init(allFields: id, name: name, address: address, email: email, isActive: isActive, isAdmin: isAdmin, zipCode: zipCode)
    }
}
