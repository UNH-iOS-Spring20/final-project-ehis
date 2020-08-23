//
//  CreateFoodieView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateFoodieView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var address = ""
    @State var email = ""
    @State var phone = ""
    @State var zipCode = ""
    @State var city = ""
    @State var state = ""    
    //    @State var sessionFoodieUser: FoodieUser?
    
    var body: some View {
        Group{
            VStack (spacing: 20) {
                TextField("Name", text: $name)
                    .border(Color.black)
                
                TextField("email", text: $email)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.emailAddress)
                    .autocapitalization(UITextAutocapitalizationType.none)
                
                TextField("Phone", text: $phone)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.decimalPad)
                
                TextField("Address", text: $address)
                    .border(Color.black)
                
                TextField("City", text: $city)
                    .border(Color.black)
                
                HStack{
                    TextField("State", text: $state)
                        .border(Color.black)
                        .autocapitalization(UITextAutocapitalizationType.allCharacters)
                    
                    TextField("Zip Code", text: $zipCode)
                        .border(Color.black)
                        .keyboardType(UIKeyboardType.decimalPad)
                }
                
                Button(action: {
                    self.createFoodie()
                }) {
                    Text("Create!")
                        .font(.largeTitle)
                }
            }.font(.title)
                .navigationBarTitle("Create foodie", displayMode: .inline)
            Spacer()
        }.padding()
        
    }
    
    func createFoodie(){
        print("creating foodie...")
        if !name.isEmpty && !address.isEmpty && !email.isEmpty && !phone.isEmpty && !zipCode.isEmpty && !city.isEmpty && !state.isEmpty{
            let data = [
                "name": name,
                "address": address,
                "email": email,
                "phone": phone,
                "isActive": true,
                "zipCode": zipCode,
                "city": city,
                "state": state
                ] as [String : Any]
            
            let docId = foodiesCollectionRef.addDocument(data: data).documentID
            // lets me have a copy of the new doc's id... for use with initializing sessionFoodieUser
            //foodiesCollectionRef.addDocument(data: data)
            print("foodie created!")
        }
        else {
            print("failed to create... invalid credentials given")
        }
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CreateFoodieView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFoodieView()
    }
}
