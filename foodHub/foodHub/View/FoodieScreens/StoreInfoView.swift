//
//  StoreInfoView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/13/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct StoreInfoView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @ObservedObject var foodie: FoodieUser
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack{
                ImageViewController(imageUrl: foodie.photo)
                
                Text(foodie.name)
                    .font(.title)                
            }
            if !foodie.address.isEmpty {
                Text(foodie.address)
            }
            
            if !foodie.city.isEmpty {
                Text(foodie.city)
            }
            
            HStack{
                if !foodie.state.isEmpty {
                    Text(foodie.state + ", ")
                }
                
                Text(foodie.zipCode)
            }
            
            if !foodie.email.isEmpty {
                HStack{
                    Text("Contact us:")
                    VStack{
                        Text(foodie.email)
                        Text(foodie.phone)
                    }
                }
            }
            
            if sessionUser.validateFoodie(foodie: foodie) || sessionUser.isAdmin() {
                NavigationLink(
                    destination: EditFoodieView(foodie: self.foodie)
                ){
                    Text("Edit info")
                }
            }
        }.padding()
            .font(.body)
        
    }
}

struct StoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInfoView(foodie: FoodieUser.example)
    }
}
