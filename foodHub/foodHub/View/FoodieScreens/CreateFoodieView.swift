//
//  CreateFoodieView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateFoodieView: View {
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
            VStack {
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
            
            foodiesCollectionRef.addDocument(data: data)
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

/*
 private func createFoodie(_ name: String, _ email: String, _ address: String, _ zipCode: String, _ city: String, _ state: String, _ isActive: Bool) -> (Bool, String, FoodieUser?) {
 /*
 let foodieRef = db.collection("foodies")
 let tempId = name + "-" + zipCode
 let tempFoodie: FoodieUser? = FoodieUser(name, address, email, zipCode, city, state)
 //    let tempFoodie = FoodieUser(allFields: tempId, name: name, address: address, email: email, isActive: isActive, zipCode: zipCode, city: city, state: state)
 var outBool: Bool = false
 var outString: String = "User already exists"
 
 if (tempFoodie == nil) {
 print("Unable to create foodie")
 outString = "Invalid details given"
 }
 else {
 foodieRef.document(tempId).getDocument {
 (document, error) in
 if !document!.exists {
 foodieRef.document(tempId).setData([
 "name": tempFoodie?.name,
 "email": tempFoodie?.email,
 "zipCode": tempFoodie?.zipCode,
 "city": tempFoodie?.city,
 "state": tempFoodie?.state,
 "isActive": tempFoodie?.isActive
 ], merge: true)
 if tempFoodie?.address != "" {
 foodieRef.document(tempId).setData([
 "address": tempFoodie?.address
 ], merge: true)
 }
 print("Foodie created")
 outBool = true
 outString = ""
 }
 else {
 print("Unable to create foodie")
 print("Foodie exists")
 }
 }
 }
 
 /*
 else {
 foodieRef.document(tempId).getDocument {
 (document, error) in
 if !document!.exists {
 foodieRef.document(tempId).setData([
 "name": tempFoodie?.name!,
 "email": tempFoodie?.email!,
 "zipCode": tempFoodie?.zipCode!,
 "city": tempFoodie?.city!,
 "state": tempFoodie?.state!,
 "isActive": tempFoodie?.isActive!
 ], merge: true)
 if tempFoodie?.address != "" {
 foodieRef.document(tempId).setData([
 "address": tempFoodie?.address!
 ], merge: true)
 }
 print("Foodie created")
 outBool = true
 outString = ""
 }
 else {
 print("Unable to create foodie")
 print("Foodie exists")
 }
 }
 }
 */
 return (outBool, outString)
 */
 return (true, "Hard code", nil)
 }
 */
