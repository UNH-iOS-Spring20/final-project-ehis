//
//  AppTabView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let foodiesCollectionRef = Firestore.firestore().collection("foodies")

let eatersCollectionRef = Firestore.firestore().collection("eaters")

let creditsCollectionRef = Firestore.firestore().collection("credits")

struct AppTabView: View {
    @EnvironmentObject var sessionUser: SessionUser
    
    var body: some View {
        TabView {
            FoodieHomeView().tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            SettingsView(newNavView: true).tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
            
            if sessionUser.isEater {
                EaterDetailView(eater: sessionUser.sessionUser as! EaterUser).tabItem{
                    Image(systemName: "info.circle")
                    Text("My info")
                }
            }
            
            CreditsView().tabItem{
                Image(systemName: "c.circle")
                Text("Credits")
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    // fix to prevent Preview from freezing
    static let sessionUser = SessionUser()
    static var previews: some View {
        AppTabView().environmentObject(sessionUser)
    }
}
