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
//    var foodies = ContentView.foodies
    // copying from ContentView.foodies makes me need to refresh the page for info to show
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (query: queryFoodies)
//    var foodies = ContentView.foodies
    var body: some View {
//        NavigationView{
        VStack{
            List {
                ForEach(foodies.items) { foodie in
                    NavigationLink(destination: FoodieDetailView(foodie: foodie)){
                        Text(foodie.id)
                    }
                }
            }
            .navigationBarTitle("Foodies near me")
        }
//        }
    }
}

struct ListFoodiesView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodiesView()
    }
}
