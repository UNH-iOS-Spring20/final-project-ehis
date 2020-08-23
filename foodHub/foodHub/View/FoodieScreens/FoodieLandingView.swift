//
//  FoodieView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct FoodieLandingView: View {
    @State static var sessionFoodieUser: FoodieUser?
    // static state var makes it such that there can be ONE active foodie user during the session
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: CreateFoodieView()
            ){
                Text("New foodie")
                    .font(.largeTitle)
            }
            .padding(10)
            
            NavigationLink(
                destination: FoodieHomeView()
            ){
                Text("Skip")
                    .font(.largeTitle)
            }
            .padding(10)
        }
    }
}

struct FoodieView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieLandingView()
    }
}

