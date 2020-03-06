//
//  FoodieView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct FoodieView: View {
    var body: some View {
        VStack {
            Button(action: {
                createFoodie()
            }) {
             Text("New foodie")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                updateFoodies()
            }) {
             Text("Update foodies")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                ContentView.getCollection(collection: "foodies")
            }) {
             Text("Get all foodies")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                ContentView.deleteCollection(collection: "foodies")
            }) {
             Text("Delete all foodies")
                .font(.largeTitle)
            }
            .padding(10)
            
        }
    }
}

private func createFoodie(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("Humpy-06510").setData([
        "name": "Humpty",
        "city": "UNH",
        "zipCode": "06516",
        "isActive": true
    ])
    print("Foodie(s) created")
}

private func updateFoodies(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("McDonalds-06516").setData([
        "address": "300 Boston Post Rd",
        "city": "West Haven Haven",
        "state": "CT",
        "zipCode": "06516",
        "isActive": true
    ], merge: true)
    print("Foodie(s) updated")
}

struct FoodieView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieView()
    }
}
