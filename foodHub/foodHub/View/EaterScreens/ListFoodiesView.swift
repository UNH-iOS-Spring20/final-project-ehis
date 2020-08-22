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
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (collectionRef: foodiesCollectionRef)
    var body: some View {
        VStack{
            List {
                ForEach(foodies.items) { foodie in
                    
                    if foodie.data["isActive"] as! Bool {
                        NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                            Text(foodie.data["name"] as! String)
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
