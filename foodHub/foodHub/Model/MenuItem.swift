//
//  MenuItem.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

struct MenuItem: Identifiable {
    var id: String
    var owner: String
//    var ownerZip: String
    var name: String
    var customizable: Bool
    var members = [String]()
    
    init(){
        self.id = ""
        self.owner = ""
        self.name = ""
        self.customizable = false
    }
    
    init (noID owner: String, name: String, customizable: Bool, members: [String]){
        self.id = owner + "-" + name
        self.owner = owner
//        self.ownerZip = ownerZip
        self.name = name
        self.customizable = customizable
        self.members = members
    }
    
    init (id: String, owner: String, name: String, customizable: Bool, members: [String]){
        self.id = id
        self.owner = owner
        self.name = name
        self.customizable = customizable
        self.members = members
    }
}

extension MenuItem: DocumentSerializable {
    init? (id: String, dictionary: [String: Any]) {
        guard let owner = dictionary["owner"] as? String,
            let name = dictionary["name"] as? String,
            let customizable = dictionary["customizable"] as? Bool,
            let members = dictionary["members"] as? [String]
        else {
            return nil
        }
        
        self.init(id: id, owner: owner, name: name, customizable: customizable, members: members)
    }
    
}
