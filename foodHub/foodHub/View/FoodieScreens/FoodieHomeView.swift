//
//  FoodieHomeView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct FoodieHomeView: View {
    @EnvironmentObject var sessionUser: SessionUser
    
    var body: some View {
        NavigationView{
            VStack {
                if sessionUser.isFoodie {
                    FoodieDetailView(foodie: sessionUser.sessionUser as! FoodieUser)
                }
//                else if sessionUser.isEater {
//                    EaterDetailView(eater: sessionUser.sessionUser as! EaterUser)
//                }
                else {
                    ListFoodiesView()
                }
            }
        }
    }
}

struct FoodieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieHomeView()
    }
}

