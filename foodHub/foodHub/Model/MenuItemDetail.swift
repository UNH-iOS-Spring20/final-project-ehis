//
//  MenuItemDetail.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

class MenuItemDetail {
    var size: String
    var price: Double
    var description: String
    
    init? (size: String, price: Double, description: String){
        if price < 0 {
            return nil
        }
        self.size = size
        self.price = price
        self.description = description
    }
}
