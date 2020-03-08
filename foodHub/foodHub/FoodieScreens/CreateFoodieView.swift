//
//  CreateFoodieView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/7/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateFoodieView: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var email: String = ""
    @State var zipCode: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var success: Bool = true
    @State var status: String = ""
    
    var body: some View {
        VStack {
            TextField(" Name", text: $name)
                .border(Color.black)
            
            TextField(" email", text: $email)
                .border(Color.black)
                .autocapitalization(UITextAutocapitalizationType.none)
            
            TextField(" Address", text: $address)
                .border(Color.black)
            
            TextField(" Zip Code", text: $zipCode)
                .border(Color.black)
            
            TextField(" City", text: $city)
                .border(Color.black)
            
            TextField(" State", text: $state)
                .border(Color.black)
            
            Button(action: {
                
                (self.success, self.status) = createFoodie(self.name, self.email, self.address, self.zipCode, self.city, self.state, true)
            }) {
             Text("Create!")
                .font(.largeTitle)
            }
            .padding(10)
            
            if !success {
                Text(status)
                    .font(.body)
                    .frame(alignment: .trailing)
            }
            //.padding(10)
        }
        .padding(15)
        .font(.title)
    }
}

struct CreateFoodieView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFoodieView()
    }
}

private func createFoodie(_ name: String, _ email: String, _ address: String, _ zipCode: String, _ city: String, _ state: String, _ isActive: Bool) -> (Bool, String) {
    let foodieRef = db.collection("foodies")
    let tempFoodie = FoodieUser(name, zipCode, address, email, city, state)
    let tempId = name + "-" + zipCode
    var outBool: Bool = true
    var outString: String = ""
    
    if (tempFoodie == nil) {
        print("Unable to create foodie")
        outBool = false
        outString = "Invalid details given"
    }
    else {
        foodieRef.document(tempId).getDocument {
            (document, error) in
            if !document!.exists {
                foodieRef.document(tempId).setData([
                    "name": tempFoodie!.name,
                    "email": tempFoodie!.email,
                    "zipCode": tempFoodie!.zipCode,
                    "city": tempFoodie!.city,
                    "state": tempFoodie!.state,
                    "isActive": tempFoodie!.isActive
                ], merge: true)
                if tempFoodie!.address != "" {
                    foodieRef.document(tempId).setData([
                        "address": tempFoodie!.address
                    ], merge: true)
                }
                print("Foodie created")
            }
            else {
                print("Unable to create foodie")
                outBool = false
                outString = "User already exists"
            }
        }
    }
    return (outBool, outString)
}
