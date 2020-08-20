//
//  FoodieDetailView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI


struct FoodieDetailView: View {
    @ObservedObject var foodie: FoodieUser
    //    var menuItems: [MenuItemDetail]
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: StoreInfoView(foodie: self.foodie)
            ){
                Text("Store Info!")
                    .font(.body)
            }
            .padding(10)
            .navigationBarTitle(foodie.name)
        }.padding()
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
