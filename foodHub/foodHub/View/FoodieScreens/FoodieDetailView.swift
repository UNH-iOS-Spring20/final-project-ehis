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
                    NavigationLink(destination: MenuView(menuItem: menuItem)){
                        Text(menuItem.name)
                    }
                    
                }.onDelete(perform: deleteItem)
                Spacer()
            }
            
            NavigationLink(
                destination: StoreInfoView(foodie: self.foodie)
            ){
                Text("Store Info!")
                    .font(.body)
            }
            .padding()
        }.padding()
            .navigationBarTitle(foodie.name)
            .navigationBarItems(trailing: EditButton())
    }
    
    func deleteItem(at offsets: IndexSet){
        print("Starting delete...")
        menu.deleteItem(collectionRef: menuCollectionRef, index: offsets.first!)
        
    }
    /*
     func removeMenuItem (at offsets: IndexSet) {
     foodie.menu.deleteItem(index: offsets.first!)
     }
     */
}

struct FoodieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieDetailView(foodie: FoodieUser(id: "1", data: [
            "name": "name",
            "address": "address",
            "email": "email",
            "phone": "phone",
            "isActive": true,
            "zipCode": "zipCode",
            "city": "city",
            "state": "state"
        ])!)
    }
}

/*
 func getGroupName (menuItems: FirebaseCollection<MenuItem>, itemGroup: String) -> (String) {
 for temp in menuItems.items {
 if temp.id == itemGroup {
 return (temp.name)
 }
 }
 return ""
 }
 
 func getMenuItemGroup (menuItems: FirebaseCollection<MenuItem>, itemGroup: String) -> (MenuItem) {
 for temp in menuItems.items {
 if temp.id == itemGroup {
 return (temp)
 }
 }
 return MenuItem()
 }
 
 func fetchItemName (item: String) -> String {
 let docRef = queryMenuItems.document(item)
 
 docRef.getDocument { (document, error) in
 if let document = document, document.exists {
 
 out = document.data()!["name"] as! String
 print("Document found: \(item), \(out)")
 }
 }
 return out
 }
 */
