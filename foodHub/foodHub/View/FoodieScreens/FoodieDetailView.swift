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
    
    @State private var isFavorite = false
    
    init(foodie: FoodieUser) {
        self.foodie = foodie
        self.menuCollectionRef = foodiesCollectionRef.document(foodie.id).collection("menu")
        self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
    }
    
    var body: some View {
        VStack {
            List {
                if sessionUser.validateFoodie(foodie: foodie) || sessionUser.isAdmin() {
                    //only want to enable deletes for appropriate superUser
                    ForEach(menu.items) { menuItem in
                        NavigationLink(destination: MenuView(menuCollectionRef: self.menuCollectionRef, menuItem: menuItem, owner: self.foodie)){
                            Text(menuItem.name)
                        }
                    }.onDelete(perform: deleteItem)
                }
                else {
                    ForEach(menu.items) { menuItem in
                        NavigationLink(destination: MenuView(menuCollectionRef: self.menuCollectionRef, menuItem: menuItem, owner: self.foodie)){
                            Text(menuItem.name)
                        }
                    }
                }
                Spacer()
            }
            
            HStack{
                NavigationLink(
                    destination: StoreInfoView(foodie: self.foodie)
                ){
                    Image(systemName: "info.circle")
                }
                Spacer()
                
                if self.sessionUser.isEater {
                    if !(self.sessionUser.sessionUser as! EaterUser).favorites.contains(self.foodie.id) {
                        Button(action: {
                            (self.sessionUser.sessionUser as! EaterUser).favorites.append(self.foodie.id)
                            self.updateFavorites()
                            self.isFavorite.toggle()
                            
                        }){
                            Text("Add to favorites")
                        }
                    }
                }
                
                if sessionUser.validateFoodie(foodie: foodie) || sessionUser.isAdmin() {
                    NavigationLink(
                        destination: CreateMenuView(menuCollectionRef: menuCollectionRef)
                    ){
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }.padding()
            .alert(isPresented: $isFavorite){
                Alert(title: Text("Added to favorites!"), dismissButton: .default(Text("OK ")))
        }
        .navigationBarTitle("\(foodie.name)'s Menu")
        .navigationBarItems(trailing:
            HStack{
                if sessionUser.validateFoodie(foodie: foodie) || sessionUser.isAdmin() {
                    EditButton()
                }
        })
    }
    
    func updateFavorites(){
        let eater = self.sessionUser.sessionUser as! EaterUser
        eatersCollectionRef.document(eater.id).setData(eater.data)
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


/*
 (self.sessionUser.sessionUser as! EaterUser).favorites.remove(at: (self.sessionUser.sessionUser as! EaterUser).favorites.firstIndex(of: self.foodie.id)!)
 */
