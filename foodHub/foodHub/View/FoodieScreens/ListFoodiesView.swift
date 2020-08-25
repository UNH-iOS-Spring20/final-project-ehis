//
//  ListFoodiesView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ListFoodiesView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (collectionRef: foodiesCollectionRef)
    
    @State var showFavorites: Bool = false
    
    var body: some View {
        VStack{
            List {
                
                if self.sessionUser.isEater {
                    Toggle(isOn: $showFavorites) {
                        Text("Favorites")
                    }
                }
                
                ForEach(foodies.items) { foodie in
                    if foodie.data["isActive"] as! Bool {
                        HStack {
                            if !self.showFavorites {
                                NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                                    ImageViewController(imageUrl: foodie.data["photo"] as! String)
                                    Text(foodie.data["name"] as! String)
                                    
                                    Spacer()
                                    
                                    if self.sessionUser.isEater {
                                        Image(systemName: ((self.sessionUser.sessionUser as! EaterUser).favorites.contains(foodie.id)) ? "star.fill" : "star")
                                    }
                                }
                            }
                            else {
                                if (self.sessionUser.sessionUser as! EaterUser).favorites.contains(foodie.id) {
                                    NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                                        ImageViewController(imageUrl: foodie.data["photo"] as! String)
                                        Text(foodie.data["name"] as! String)
                                        Spacer()
                                        Image(systemName: "star.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Foodies near me")
            }
        }
    }
}

struct ListFoodiesView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodiesView()
    }
}
