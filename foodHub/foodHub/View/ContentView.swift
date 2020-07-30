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

let db = Firestore.firestore()

struct ContentView: View {
    @ObservedObject private var fbSession = firebaseSession
    
    var body: some View {
        VStack{
            List {
                Text("Foodies")
//                ForEach(fbSession)
            }
        }
    }


    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
