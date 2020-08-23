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
    @Published var isSet: Bool
    
    init () {
        sessionUser = "no initialized session user"
        isSet = false
    }
    
    init (foodie: FoodieUser) {
        sessionUser = foodie
        isSet = true
    }
    
    init (eater: EaterUser) {
        sessionUser = eater
        isSet = true
    }
}
