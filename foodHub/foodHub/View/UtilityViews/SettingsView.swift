//
//  SettingsView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

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
    
    struct AlertItem: Identifiable {
        var id = UUID()
        var title: Text
        var message: Text?
        var dismissButton: Alert.Button?
    }
    
    struct DebugView: View{
        @EnvironmentObject var sessionUser: SessionUser
        
        @State private var alertItem: AlertItem?
        
        var body: some View {
            VStack (alignment: .leading, spacing: 20){
                if !self.sessionUser.isEater && !self.sessionUser.isFoodie {
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
                }
                Button(action: {
                    if self.sessionUser.isEater || self.sessionUser.isFoodie{
                        self.alertItem = AlertItem(title: Text("Logoff successful!"), message: Text(""), dismissButton: .default(Text("OK ")))
                    }
                    else {
                        self.alertItem = AlertItem(title: Text("Can't logoff!"), message: Text("Sign in before logoff."), dismissButton: .default(Text("OK ")))
                    }
                    
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
                .alert(item: $alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(newNavView: true)
    }
}
