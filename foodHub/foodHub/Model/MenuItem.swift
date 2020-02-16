//
//  MenuItem.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
enum MenuErrors: Error{
    case nilItem
}

class MenuItem{
    var name: String
    var hasSizes: Bool
    var info: [String: Double] //size, price
    var descriptions: [String]
    
    init? (_ name: String, _ hasSizes: Bool, _ info: [String: Double], _ descriptions: [String]){
        if name.isEmpty || info.values.contains(where: {$0 < 0.0}) {
            return nil
        }
        if (info.count != descriptions.count) || (hasSizes && info.count <= 1){
            return nil
        }
        
        self.name = name
        self.hasSizes = hasSizes
        self.info = info
        self.descriptions = descriptions
    }
}
