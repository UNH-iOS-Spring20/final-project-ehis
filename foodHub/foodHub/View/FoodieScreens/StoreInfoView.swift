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
            NavigationLink(
                destination: EditFoodieView(foodie: self.foodie)
            ){
                Text("Edit info")
            }
        }.padding()
        .font(.body)
        
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
