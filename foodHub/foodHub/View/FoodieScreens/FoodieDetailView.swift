//
//  FoodieDetailView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct FoodieDetailView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @ObservedObject var foodie: FoodieUser
    @ObservedObject var menu: FirebaseCollection<MenuItem>
    private var menuCollectionRef: CollectionReference
    
    init(foodie: FoodieUser) {
        self.foodie = foodie
        self.menuCollectionRef = foodiesCollectionRef.document(foodie.id).collection("menu")
        self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(menu.items) { menuItem in
                    NavigationLink(destination: MenuView(menuCollectionRef: self.menuCollectionRef, menuItem: menuItem, owner: self.foodie)){
                        Text(menuItem.name)
                    }
                    
                }.onDelete(perform: deleteItem)
                Spacer()
            }
            
            HStack{
                NavigationLink(
                    destination: StoreInfoView(foodie: self.foodie)
                ){
                    Image(systemName: "info.circle")
                }
                Spacer()
                
                if sessionUser.validateFoodie(foodie: foodie) {
                    NavigationLink(
                        destination: CreateMenuView(menuCollectionRef: menuCollectionRef)
                    ){
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }.padding()
            .navigationBarTitle("\(foodie.name)'s Menu")
            .navigationBarItems(trailing:
                HStack{
                    if sessionUser.validateFoodie(foodie: foodie) {
                        EditButton()
                    }
            })
    }
    
    func deleteItem(at offsets: IndexSet){
        print("Starting delete...")
        menu.deleteItem(collectionRef: menuCollectionRef, index: offsets.first!)
        
    }
}

struct FoodieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieDetailView(foodie: FoodieUser.example)
    }
}
