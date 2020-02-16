//
//  StoreMenu.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

class StoreMenu {
    var items: [MenuItem] //don't want nil values
    
    init (){
        self.items = []
    }
    init? (_ items: [MenuItem]){
        if items.isEmpty {
            return nil
        }
        
        self.items = items
    }
}
