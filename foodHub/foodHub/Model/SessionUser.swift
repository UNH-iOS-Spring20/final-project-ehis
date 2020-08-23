//
//  SessionUser.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import UIKit

class SessionUser: ObservableObject{
    @Published var sessionUser: Any
    @Published var isFoodie: Bool
    @Published var isEater: Bool
    
    init () {
        self.sessionUser = "no initialized session user"
        self.isFoodie = false
        self.isEater = false
        
        print("session user is empty")
    }
   
    
    func setEater (eater: EaterUser) {
        self.sessionUser = eater
        self.isFoodie = true
        self.isEater = true
    }
    
    func setFoodie(foodie: FoodieUser){
        self.sessionUser = foodie
        self.isFoodie = true
        self.isEater = false

        print("session user is \(foodie.name)")
    }
    
    func reset () {
        self.sessionUser = "no initialized session user"
        self.isFoodie = false
        self.isEater = false
        
        print("session user is empty")
    }
}
