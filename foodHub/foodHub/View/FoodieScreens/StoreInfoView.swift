//
//  StoreInfoView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/13/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct StoreInfoView: View {
    let foodie: FoodieUser
    var body: some View {
        VStack(alignment: .leading, spacing: 1){
            Text(foodie.name)
                .font(.title)
            if foodie.address != nil {
                Text(foodie.address!)
                    .font(.body)
            }
            
            if foodie.city != nil {
                Text(foodie.city!)
                    .font(.body)            }
            
            HStack{
                if foodie.state != nil {
                    Text(foodie.state! + ", ")
                        .font(.body)
                }
                
                Text(foodie.zipCode)
                    .font(.body)
            }
            
            if foodie.email != nil {
                HStack{
                    Text("Contact us:")
                        .font(.body)
                    
                    Text(foodie.email!)
                        .font(.body)
                }
            }
        }.padding()
    }
}

struct StoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInfoView(foodie: FoodieUser(allFields: "Test", name: "Test", address: nil, email: nil, isActive: true, zipCode: "00000", city: nil, state: nil, menuItems: ["N/A"])!)
    }
}
