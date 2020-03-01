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
            HStack{
                Button(action: {
                    createEater()
                }) {
                 Text("New eater")
                    .font(.body)
                }
                .padding(10)
                
                Button(action: {
                    createFoodie()
                }) {
                 Text("New foodie")
                    .font(.body)
                }
                .padding(10)
            }
            .padding(10)
            
            HStack{
                Button(action: {
                    updateEater()
                }) {
                 Text("Update eaters")
                    .font(.body)
                }
                .padding(10)
                
                Button(action: {
                    updateFoodies()
                }) {
                 Text("Update foodies")
                    .font(.body)
                }
                .padding(10)
            }
            .padding(10)
            
            HStack{
                Button(action: {
                    getCollection(collection: "eaters")
                }) {
                 Text("Get all eaters")
                    .font(.body)
                }
                .padding(10)
                
                Button(action: {
                    getCollection(collection: "foodies")
                }) {
                 Text("Get all foodies")
                    .font(.body)
                }
                .padding(10)
            }
            .padding(10)
            
            HStack{
                Button(action: {
                    deleteCollection(collection: "eaters")
                }) {
                 Text("Delete all eaters")
                    .font(.body)
                }
                .padding(10)
                
                Button(action: {
                    deleteCollection(collection: "foodies")
                }) {
                 Text("Delete all foodies")
                    .font(.body)
                }
                .padding(10)
            }
        }
    }
}

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
    
private func deleteCollection(collection: String){
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

private func createEater(){
    let foodieRef = db.collection("eaters")
    
    foodieRef.document("test_bot_1").setData([
        "name": "Testy Bot",
        "email": "testbot01@gmail.com",
        "zipCode": 06510
    ])
    print("Eater(s) created")
}

private func updateEater(){
    let foodieRef = db.collection("eaters")
    
    foodieRef.document("test_bot_1").setData([
        "name": "Testy Bot 01",
        "email": "testbot01@gmail.com",
        "zipCode": 06510
    ])
    print("Eater(s) updated")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
