//
//  SettingsView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


let foodiesCollectionRef = Firestore.firestore().collection("foodies")
let eatersCollectionRef = Firestore.firestore().collection("eaters")

struct SettingsView: View {
    @EnvironmentObject var sessionUser: SessionUser
    var newNavView: Bool
    
    var body: some View {
        
        HStack{
            if newNavView {
                NavigationView {
                    DebugView()
                }
            }
            else {
                DebugView()
            }
        }
        
    }
    
    struct DebugView: View{
        @EnvironmentObject var sessionUser: SessionUser
        var body: some View {
            VStack (alignment: .leading, spacing: 20){
                NavigationLink(
                    destination: EaterLandingView()
                    )
                {
                    Text("Login as Eater")
                        .font(.largeTitle)
                }
                NavigationLink(
                    destination: FoodieLandingView()
                    )
                {
                    Text("Login as Foodie")
                        .font(.largeTitle)
                }
                Button(action: {
                    self.sessionUser.reset()
                    print("session user reset")
                }) {
                    HStack{
                        Image(systemName: "stop.circle")
                        Text("Log off")
                            .font(.largeTitle)
                    }
                }
            }.navigationBarTitle("FoodHub", displayMode: .inline)
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(newNavView: true)
    }
}
