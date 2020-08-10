//
//  MenuItemSuper.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/3/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

struct MenuItemGroup: Identifiable {
    var id: String
    var name: String
    var owner: String
    var hasSizes: Bool
    var customizable: Bool
    var info = [String]()
    
    init (oneSize id: String, name: String, owner: String, hasSizes: Bool, customizable: Bool, myInfo: String){
        self.id = id
        self.name = name
        self.owner = owner
        self.hasSizes = hasSizes
        self.customizable = customizable
        self.info.append(myInfo)
    }
    
    init (multiSize id: String, name: String, owner: String, hasSizes: Bool, customizable: Bool, myInfo: [String]){
        self.id = id
        self.name = name
        self.owner = owner
        self.hasSizes = hasSizes
        self.customizable = customizable
        self.info.append(contentsOf: myInfo)
    }
    
    init (noID name: String, owner: String, hasSizes: Bool, customizable: Bool, myInfo: [String]){
        self.id = owner + "-" + name
        self.name = name
        self.owner = owner
        self.hasSizes = hasSizes
        self.customizable = customizable
        self.info.append(contentsOf: myInfo)
    }
    
    init (oneSizeNoID name: String, owner: String, hasSizes: Bool, customizable: Bool, myInfo: String){
        self.id = owner + "-" + name
        self.name = name
        self.owner = owner
        self.hasSizes = hasSizes
        self.customizable = customizable
        self.info.append(myInfo)
    }
}

extension MenuItemGroup: DocumentSerializable {
    init? (id: String, dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let owner = dictionary["owner"] as? String,
            let hasSizes = dictionary["hasSizes"] as? Bool,
            let customizable = dictionary["customizable"] as? Bool,
            let tempInfo = dictionary["info"] as? [DocumentReference]
        else {
            return nil
        }
        
        var info = [String]()
        for item in tempInfo {
            info.append(item.path)
        }
        
        self.init(multiSize: id, name: name, owner: owner, hasSizes: hasSizes, customizable: customizable, myInfo: info)
    }
    
}
