//
//  EaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EaterLandingView: View {
    var body: some View {
        VStack {
            NavigationLink(
                destination: CreateEaterView()
            ){
                Text("New eater")
                    .font(.largeTitle)
            }
            .padding(10)
            
            NavigationLink(
                destination: EaterHomeView()
            ){
                Text("Skip")
                    .font(.largeTitle)
            }
            .padding(10)
        }
    }
}

private func updateEater(){
    /*
     let eaterRef = db.collection("eaters")
     
     eaterRef.document("test_2@gmail.com").setData([
     "address": "Buckman 226, UNH",
     "isAdmin": false,
     "isActive": true
     ], merge: true)
     */
    print("Eater(s) updated")
}

struct EaterView_Previews: PreviewProvider {
    static var previews: some View {
        EaterLandingView()
    }
}

