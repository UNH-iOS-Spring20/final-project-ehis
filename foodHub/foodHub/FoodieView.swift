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

/*
private func getCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        }
        else {
            print("")
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}
 */
    
/*rivate func deleteCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            print("")
            for document in querySnapshot!.documents {
            print("Deleting \(document.documentID) => \(document.data())")
                document.reference.delete()
            }
        }
    
    }
}
*/
private func createFoodie(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("McDonalds").setData([
        "name": "McDonalds",
        "city": "West Haven",
        "zipCode": 06516
    ])
    print("Foodie(s) created")
}

private func updateFoodies(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("McDonalds").setData([
        "name": "McDonalds",
        "city": "New Haven",
        "zipCode": 06516
    ])
    print("Foodie(s) updated")
}

struct FoodieView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieView()
    }
}
