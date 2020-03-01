//
//  EaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EaterView: View {
    var body: some View {
        VStack {
            Button(action: {
                createEater()
            }) {
             Text("New eater")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                updateEater()
            }) {
             Text("Update eaters")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                ContentView.getCollection(collection: "eaters")
            }) {
             Text("Get all eaters")
                .font(.largeTitle)
            }
            .padding(10)
            
            Button(action: {
                ContentView.deleteCollection(collection: "eaters")
            }) {
             Text("Delete all eaters")
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
*/
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

struct EaterView_Previews: PreviewProvider {
    static var previews: some View {
        EaterView()
    }
}
