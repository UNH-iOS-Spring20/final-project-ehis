//
//  ContentView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                createFoodie()
            }) {
             Text("Create a foodie")
                .font(.largeTitle)
            }
            .padding(10.0)
            
            Button(action: {
                updateFoodies()
            }) {
             Text("Update foodies")
                .font(.largeTitle)
            }
            .padding(10.0)
            
            Button(action: {
                deleteCollection(collection: "foodies")
            }) {
             Text("Delete all foodies")
                .font(.largeTitle)
            }
            .padding(10.0)
            
            Button(action: {
                getCollection(collection: "foodies")
            }) {
             Text("Get all foodies")
                .font(.largeTitle)
            }
            .padding(10.0)
        }
    }
}

private func getCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        }
        else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}
    
private func deleteCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
            print("Deleting \(document.documentID) => \(document.data())")
                document.reference.delete()
            }
        }
    
    }
}

private func createFoodie(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("McDonalds").setData([
        "name": "McDonalds",
        "city": "West Haven",
        "zipCode": 06516
    ])
}

private func updateFoodies(){
    let foodieRef = db.collection("foodies")
    
    foodieRef.document("McDonalds").setData([
        "name": "McDonalds",
        "city": "New Haven",
        "zipCode": 06516
    ])
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
