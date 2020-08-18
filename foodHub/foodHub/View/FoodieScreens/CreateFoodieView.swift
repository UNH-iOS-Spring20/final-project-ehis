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
//    @State var success: Bool = true
//    @State var status: String = ""
    
//    @State var sessionFoodieUser: FoodieUser?
    
    var body: some View {
        VStack {
            TextField(" Name", text: $name)
                .border(Color.black)
            
            TextField(" email", text: $email)
                .border(Color.black)
                .autocapitalization(UITextAutocapitalizationType.none)
            
            TextField(" Address", text: $address)
                .border(Color.black)
            
            TextField(" Phone", text: $phone)
            .border(Color.black)
            
            TextField(" Zip Code", text: $zipCode)
                .border(Color.black)
            
            TextField(" City", text: $city)
                .border(Color.black)
            
            TextField(" State", text: $state)
                .border(Color.black)
            
            Button(action: {
                self.createFoodie()
//                (self.success, self.status, FoodieLandingView.sessionFoodieUser) = createFoodie(self.name, self.email, self.address, self.zipCode, self.city, self.state, true)

            }) {
             Text("Create!")
                .font(.largeTitle)
            }
            .padding(10)
            
            /*
            if !success {
                Text(status)
                    .font(.body)
                    .frame(alignment: .trailing)
            }
            */
        }
        .padding(15)
        .font(.title)
    }
    
    func createFoodie(){
        // TODO: validate data and connect to firestore
        print("creating foodie...")
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
