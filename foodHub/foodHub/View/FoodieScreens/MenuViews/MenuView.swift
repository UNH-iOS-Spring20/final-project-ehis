//
//  MenuView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/17/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menuItem: MenuItem
    
    var body: some View {
        Group {
            Text (menuItem.description)
            Text( menuItem.customizable ? "* customizable" : "* not customizable")
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
        }.navigationBarItems(trailing: Button(action: {}){
            Image(systemName: "plus.circle")
        })
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuItem: MenuItem(id: "test", data:[
            "name": "name",
            "customizable": true,
            "description": "description",
            "size": ["small", "medium"],
            "price": [0.99, 1.99]
        ])!)
    }
}
