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
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (query: queryFoodies)
    var body: some View {
//        NavigationView{
            List {
                ForEach(foodies.items) { foodie in
                    NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                            Text(foodie.id)
                    }
                }
            }
//        }
    }
}

struct ListFoodiesView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodiesView()
    }
}
