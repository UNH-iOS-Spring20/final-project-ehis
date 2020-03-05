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
        NavigationView {
            VStack{
                 
                NavigationLink(
                    destination: EaterView()
                )
                {
                    Text("Eater")
                        .font(.largeTitle)
                }
                .padding(15)
                NavigationLink(
                    destination: FoodieView()
                )
                {
                    Text("Foodie")
                        .font(.largeTitle)
                }
                .padding(15)
            }
        .navigationBarTitle(Text("I am a..."))
        }
    }


    static func getCollection(collection: String){
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
    
    static func deleteCollection(collection: String){
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
            print("")
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
