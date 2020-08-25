//
//  MenuView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct MenuView: View {
    @EnvironmentObject var sessionUser: SessionUser
    var menuCollectionRef: CollectionReference
    @ObservedObject var menuItem: MenuItem
    @ObservedObject var owner: FoodieUser
    
    var body: some View {
        Group {
            Text (menuItem.description)
            HStack {
                Text("Customizable ")
                Image(systemName: (menuItem.customizable ? "checkmark.square" : "x.square"))
            }
            HStack{
                VStack{
                    List {
                        ForEach (self.menuItem.size, id: \.self) { size in
                            Text("\(size)")
                        }
                    }
                }
                
                VStack{
                    List{
                        ForEach (self.menuItem.price, id: \.self) { price in
                            Text(String(format: "$%.2f", price))
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing:
            HStack{
                if sessionUser.validateFoodie(foodie: owner) || sessionUser.isAdmin() {
                    NavigationLink(
                        destination: EditMenuView(menuCollectionRef: menuCollectionRef, menuItem: menuItem)
                    ){
                        Image(systemName: "square.and.pencil")
                    }
                }
        })
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuCollectionRef: foodiesCollectionRef.document().collection("menu"), menuItem: MenuItem.example, owner: FoodieUser.example)
    }
}
