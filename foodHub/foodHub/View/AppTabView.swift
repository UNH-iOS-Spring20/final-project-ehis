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
        TabView{
            ContentView().tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            ListFoodiesView().tabItem{
                Image(systemName: "list.dash")
                Text("Foodies")
            }
            
            CreditsView().tabItem{
                Image(systemName: "c.circle")
                Text("Credits")
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static let sessionUser = SessionUser()
    static var previews: some View {
        AppTabView().environmentObject(sessionUser)
    }
}
