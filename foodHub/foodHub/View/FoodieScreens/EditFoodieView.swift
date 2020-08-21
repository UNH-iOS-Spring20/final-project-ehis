//
//  EditFoodieView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/20/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct EditFoodieView: View {
    @ObservedObject var foodie: FoodieUser
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group{
            VStack (spacing: 20) {
                TextField("Name", text: $foodie.name)
                    .border(Color.black)
                
                TextField("email", text: $foodie.email)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.emailAddress)
                    .autocapitalization(UITextAutocapitalizationType.none)
                
                TextField("Phone", text: $foodie.phone)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.decimalPad)
                
                TextField("Address", text: $foodie.address)
                    .border(Color.black)
                
                TextField("City", text: $foodie.city)
                    .border(Color.black)
                
                HStack{
                    TextField("State", text: $foodie.state)
                        .border(Color.black)
                        .autocapitalization(UITextAutocapitalizationType.allCharacters)
                    
                    TextField("Zip Code", text: $foodie.zipCode)
                        .border(Color.black)
                        .keyboardType(UIKeyboardType.decimalPad)
                }
                
                Button(action: {
                    self.updateFoodie()
                }) {
                    Text("Update!")
                        .font(.largeTitle)
                }
            }.font(.body)
            .navigationBarTitle("Edit \(foodie.name)")
            Spacer()
        }.padding()
    }
    
    func updateFoodie(){
        print("updating foodie...")
        if !foodie.name.isEmpty && !foodie.address.isEmpty && !foodie.email.isEmpty && !foodie.phone.isEmpty && !foodie.zipCode.isEmpty && !foodie.city.isEmpty && !foodie.state.isEmpty{
    
            foodiesCollectionRef.document(foodie.id).setData(foodie.data)
            print("foodie updated!")
        }
        else {
            print("failed to update... invalid credentials given")
        }
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditFoodieView_Previews: PreviewProvider {
    static var previews: some View {
        EditFoodieView(foodie: FoodieUser(id: "1", data: [
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
