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
    var body: some View {
        VStack{
            List {
                ForEach(foodies.items) { foodie in
                    
                    if foodie.data["isActive"] as! Bool {
                        HStack {
                            if self.sessionUser.isEater {
                                if (self.sessionUser.sessionUser as! EaterUser).favorites.contains(foodie.id) {
                                    Button(action: {
                                        (self.sessionUser.sessionUser as! EaterUser).favorites.remove(foodie.id)
                                    }){
                                        Image(systemName: "star.fill")
                                    }
                                }
                                else {
                                    Button(action: {
                                        (self.$sessionUser.sessionUser as! EaterUser).favorites.insert(foodie.id)
                                    }){
                                        Image(systemName: "star")
                                    }
                                }
                                Divider()
                            }
                            
                            
                            NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                                ImageViewController(imageUrl: foodie.data["photo"] as! String)
                                Text(foodie.data["name"] as! String)
                                
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Foodies near me")
        }
    }
}

struct ListFoodiesView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodiesView()
    }
}
