//
//  FoodieUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

struct FoodieUser{
    var id: String
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var zipCode: String
    var city: String
    var state: String
}
/*
class FoodieUser{
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var zipCode: String
    var city: String
    var state: String
    
    
    init? (_ name: String, _ zipCode: String, _ address: String, _ email: String, _ city: String, _ state: String){
        if name.isEmpty || zipCode.isEmpty {
            return nil
        }
     
        self.name = name
        self.address = address
        self.email = email
        self.isActive = true
        self.zipCode = zipCode
        self.city = city
        self.state = state
    }
}
*/
