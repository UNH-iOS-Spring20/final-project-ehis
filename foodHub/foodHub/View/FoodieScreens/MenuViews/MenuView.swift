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
    var menuCollectionRef: CollectionReference
    @ObservedObject var menuItem: MenuItem
    
    var body: some View {
        Group {
            Text (menuItem.description)
            HStack {
                Text("Customizable ")
                Image(systemName: (menuItem.customizable ? "checkmark.square" : "square"))
            }
            List {
                ForEach (menuItem.price.indices) { index in
                    HStack {
                        VStack{
                            Text(self.menuItem.size[index])
                        }
                        Spacer()
                        VStack (alignment: .trailing){
                            Text(String(format: "$%.2f", self.menuItem.price[index]))
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing: NavigationLink(
            destination: EditMenuView(menuCollectionRef: menuCollectionRef, menuItem: menuItem)
        ){
            Image(systemName: "square.and.pencil")
        })
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuCollectionRef: foodiesCollectionRef.document().collection("menu"), menuItem: MenuItem.example)
    }
}
