//
//  StoreInfoView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/13/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct StoreInfoView: View {
    @ObservedObject var foodie: FoodieUser
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(foodie.name)
                .font(.title)
            if !foodie.address.isEmpty {
                Text(foodie.address)
                    .font(.body)
            }
            
            if !foodie.city.isEmpty {
                Text(foodie.city)
                    .font(.body)            }
            
            HStack{
                if !foodie.state.isEmpty {
                    Text(foodie.state + ", ")
                        .font(.body)
                }
                
                Text(foodie.zipCode)
                    .font(.body)
            }
            
            if !foodie.email.isEmpty {
                HStack{
                    Text("Contact us:")
                        .font(.body)
                    
                    Text(foodie.email)
                        .font(.body)
                }
            }
            NavigationLink(
                destination: EditFoodieView(foodie: self.foodie)
            ){
                Text("Edit info")
                    .font(.body)
            }
        }.padding()
    }
}

struct StoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInfoView(foodie: FoodieUser(id: "1", data: [
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
