//
//  MenuItem.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
import FirebaseFirestore

class MenuItem: FirebaseCodable {
    var id: String
    @Published var name: String
    @Published var customizable: Bool
    @Published var description: String
    @Published var size = [String]()
    @Published var price = [Double]()
    
    var data: [String: Any] {
        return [
            "name": name,
            "customizable": customizable,
            "description": description,
            "size": size,
            "price": price
        ]
    }
    
    required init? (id: String, data: [String: Any]) {
        guard let name = data["name"] as? String,
            let customizable = data["customizable"] as? Bool,
            let description = data["description"] as? String,
            let size = data["size"] as? [String],
            let price = data["price"] as? [Double]
            else {
                return nil
        }
        
        if size.count != price.count {
            return nil
        }
        
        if price.contains(where: { $0 < 0.0 }) {
            return nil
        }
        
        self.id = id
        self.name = name
        self.customizable = customizable
        self.description = description
        self.size = size
        self.price = price
    }
    
    #if DEBUG
    static let example = MenuItem(id: "test", data:[
        "name": "name",
        "customizable": true,
        "description": "description",
        "size": ["small", "medium"],
        "price": [0.99, 1.99]
    ])!
    #endif
}
