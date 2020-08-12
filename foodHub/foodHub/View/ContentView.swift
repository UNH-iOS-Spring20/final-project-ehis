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

let queryFoodies = Firestore.firestore().collection("foodies2")
let queryEaters = Firestore.firestore().collection("eaters")
let queryMenuItems = Firestore.firestore().collection("menuItemUnits")
let queryMenuGroups = Firestore.firestore().collection("menuItems")


struct ContentView: View {
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (query: queryFoodies)
    @ObservedObject private var eaters = FirebaseCollection<EaterUser> (query: queryEaters)
    @ObservedObject private var menuItems = FirebaseCollection<MenuItemUnit> (query: queryMenuItems)
    @ObservedObject private var menuItemGroups = FirebaseCollection<MenuItemGroup> (query: queryMenuGroups)
 
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