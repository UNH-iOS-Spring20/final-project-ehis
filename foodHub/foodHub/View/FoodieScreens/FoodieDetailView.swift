//
//  FoodieDetailView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct FoodieDetailView: View {
    var foodie: FoodieUser
    
    var body: some View {
        VStack {
            List{
                ForEach(foodie.menuItems, id: \.self) { item in
                    Text(item)
                }.onDelete(perform: removeMenuItem)
                /*
                if FoodieLandingView.sessionFoodieUser?.id == foodie.id {
                    .onDelete
                }
                */
                Spacer()
            }
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
    
    func removeMenuItem (at offsets: IndexSet) {
        foodie.menuItems.deleteItem(index: offsets.first!)
    }
}

struct FoodieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieDetailView(foodie: FoodieUser(allFields: "Test", name: "Test", address: nil, email: nil, isActive: true, zipCode: "00000", city: nil, state: nil, menuItems: ["N/A"])!)
    }
}
