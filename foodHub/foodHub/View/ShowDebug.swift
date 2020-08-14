//
//  ShowDebug.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/11/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct ShowDebug: View {
    let menuItemGroups = ContentView.menuItemGroups
    
    private var menuItems = ContentView.menuItems
    var body: some View {
        List {
            ForEach(menuItems.items) { menuItem in
                Text(menuItem.id)
            }
        }
    }
}

struct ShowDebug_Previews: PreviewProvider {
    static var previews: some View {
        ShowDebug()
    }
}
