//
//  EaterUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.


struct EaterUser: Identifiable {
    var id: String
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var isAdmin: Bool
    var zipCode: String
}
/*
class EaterUser: Identifiable{
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
        self.name = name
        self.address = address
        self.email = email
        self.isActive = true
        self.zipCode = zipCode
    }
}
 */
