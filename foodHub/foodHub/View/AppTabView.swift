//
//  AppTabView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
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
