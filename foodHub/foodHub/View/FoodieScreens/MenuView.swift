//
//  MenuView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        List {
            Text ("Menu view")
        }
    }
}
/*
 struct MenuView: View {
 var menuItem: MenuItem
 
 @ObservedObject var menuItemDetails = FirebaseCollection<MenuItemDetail> (query: queryMenuItemDetails)
 
 var myArr = [MenuItemDetail]()
 
 var body: some View {
 //        Text(menuItem.id)
 
 //        ForEach(menuItem.members, id: \.self) { item in
 ForEach(getMenuItemDetails (menuItemDetails: menuItemDetails, itemArr: menuItem.members), id: \.self) { item in
 List{
 HStack {
 Text("size:")
 Text(item.size)
 }
 HStack {
 Text("price:")
 Text(String(format:"%.2f", item.price))
 }
 VStack (alignment: .leading){
 Text("Description:")
 Text(item.description)
 }
 //                Spacer()
 }.padding(10)
 }
 }
 }
 */

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
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
