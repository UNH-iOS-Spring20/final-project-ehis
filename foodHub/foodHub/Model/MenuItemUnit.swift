//
//  MenuItemUnit.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/3/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

struct MenuItemUnit: Identifiable {
    var id: String
    var size: String
    var price: Double
    var description = ""
    
    init (noDesc id: String, size: String, price: Double){
        self.id = id
        self.size = size
        self.price = price
    }
    
    init (full id: String, size: String, price: Double, description: String){
        self.id = id
        self.size = size
        self.price = price
        self.description = description
    }
}

extension MenuItemUnit: DocumentSerializable {
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
