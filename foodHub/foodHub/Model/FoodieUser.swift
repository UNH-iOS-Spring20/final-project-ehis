//
//  FoodieUser.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

/*
struct FoodieUser: Identifiable{
    var id: String
    var name: String
    var address: String
    var email: String
    var isActive: Bool
    var zipCode: String
    var city: String
    var state: String
}
*/

class FoodieUser: Identifiable{
    var id: String
    var name: String
    var address: String?
    var email: String?
    var isActive: Bool
    var zipCode: String
    var city: String?
    var state: String?
    /*
    var name: String?
    var address: String?
    var email: String?
    var isActive: Bool?
    var zipCode: String?
    var city: String?
    var state: String?
    */
    
    init? (_ name: String, _ address: String, _ email: String, _ zipCode: String, _ city: String, _ state: String){
        if name.isEmpty || zipCode.isEmpty {
            return nil
        }
        else {
            self.id = name + "-" + zipCode
            self.name = name
            self.address = address
            self.email = email
            self.isActive = true
            self.zipCode = zipCode
            self.city = city
            self.state = state
        }
    }
    init? (allFields id: String, name: String, address: String?, email: String?, isActive: Bool, zipCode: String, city: String?, state: String?){
        if name.isEmpty || zipCode.isEmpty {
            return nil
        }
        else {
            self.id = id
            self.name = name
            self.address = address
            self.email = email
            self.isActive = isActive
            self.zipCode = zipCode
            self.city = city
            self.state = state
        }
    }
    /*
    init? (allFields id: String, name: String?, address: String?, email: String?, isActive: Bool?, zipCode: String?, city: String?, state: String?){
        if ((name?.isEmpty) != nil) || name == nil || ((zipCode?.isEmpty) != nil) || zipCode == nil {
            return nil
        }
        else {
            self.id = id
            self.name = name
            self.address = address
            self.email = email
            self.isActive = isActive
            self.zipCode = zipCode
            self.city = city
            self.state = state
        }
    }
     */
}

