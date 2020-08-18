//
//  MenuView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var menuItem: MenuItem
    
    @ObservedObject var menuItemDetails = FirebaseCollection<MenuItemDetail> (query: queryMenuItemDetails)
    
    var body: some View {
        Text(menuItem.id)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuItem: MenuItem())
    }
}
//
//func temp (group: String) {
//
//    ForEach(ContentView.$menuItemDetails, id: \.self) { item in
//        var test = ContentView.$menuItemDetails
//
//    }
//
//}
