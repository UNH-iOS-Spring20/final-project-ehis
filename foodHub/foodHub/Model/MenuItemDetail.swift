//
//  MenuItemDetail.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

struct MenuItemDetail: Identifiable {
    var id: String
    var size: String
    var price: Double
    var description: String
    
    init (full id: String, size: String, price: Double, description: String){
        self.id = id
        self.size = size
        self.price = price
        self.description = description
    }
}

extension MenuItemDetail: DocumentSerializable {
    init? (id: String, dictionary: [String: Any]) {
        guard let size = dictionary["size"] as? String,
            let price = dictionary["price"] as? Double,
            let description = dictionary["description"] as? String
        else {
            return nil
        }
        
        self.init(full: id, size: size, price: price, description: description)
    }
}
