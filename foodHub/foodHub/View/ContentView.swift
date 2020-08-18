//
//  ContentView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
// back on 07/28 :)
import SwiftUI
import FirebaseFirestore


let foodiesCollectionRef = Firestore.firestore().collection("foodies")
let eatersCollectionRef = Firestore.firestore().collection("eaters")
//let queryMenuItems = Firestore.firestore().collection("menuItems")
//let queryMenuItemDetails = Firestore.firestore().collection("menuItemDetails")


struct ContentView: View {
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (collectionRef: foodiesCollectionRef)
    @ObservedObject private var eaters = FirebaseCollection<EaterUser> (collectionRef: eatersCollectionRef)
//    @ObservedObject static var menuItems = FirebaseCollection<MenuItem> (query: queryMenuItems)
//    @ObservedObject static var menuItemDetails = FirebaseCollection<MenuItemDetail> (query: queryMenuItemDetails)
 
    var body: some View {
        VStack{
            Debug()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
