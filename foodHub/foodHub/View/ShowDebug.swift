//
//  ShowDebug.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/11/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct ShowDebug: View {
    //    let menuItemGroups = ContentView.menuItemGroups
    
    var body: some View {
        List {
            Text("Debug screen")
        }.navigationBarTitle("Showing random debug")
    }
}

struct ShowDebug_Previews: PreviewProvider {
    static var previews: some View {
        ShowDebug()
    }
}
