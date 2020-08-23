//
//  FoodieLandingView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct FoodieLandingView: View {
    @EnvironmentObject var sessionUser: SessionUser
    
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
                destination: SelectFoodiesView()
            ){
                Text("Login")
                    .font(.largeTitle)
            }
            .padding(10)
        }
    }
    
    struct SelectFoodiesView: View {
        @EnvironmentObject var sessionUser: SessionUser
        @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (collectionRef: foodiesCollectionRef)
        var body: some View {
            VStack{
                Text("Select your user: ")
                List {
                    ForEach(foodies.items) { foodie in
                        
                        Button(action: {
                            self.setSessionFoodie(foodie: foodie)
                        }){
                            HStack{
                                ImageViewController(imageUrl: foodie.data["photo"] as! String)
                                Text(foodie.data["name"] as! String)
                            }
                        }
                    }
                }
                NavigationLink(
                    destination: FoodieHomeView()
                    )
                {
                    Text("Confirm")
                        .font(.largeTitle)
                }
            }
        }
        
        private func setSessionFoodie(foodie: FoodieUser) {
            sessionUser.setFoodie(foodie: foodie)
        }
    }
}

struct FoodieView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieLandingView()
    }
}

