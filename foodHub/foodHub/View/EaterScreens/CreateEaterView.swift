//
//  CreateEaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateEaterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var email: String = ""
    @State var zipCode: String = ""
    
    var body: some View {
        Group{
            VStack (spacing: 20) {
                TextField("Name", text: $name)
                    .border(Color.black)
                
                TextField("email", text: $email)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.emailAddress)
                    .autocapitalization(UITextAutocapitalizationType.none)
                
                TextField("Zip Code", text: $zipCode)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.decimalPad)
                
                Button(action: {
                    self.createEater()
                }) {
                    Text("Create!")
                        .font(.largeTitle)
                }
            }.font(.title)
                .navigationBarTitle("Create user")
            Spacer()
        }.padding()
    }
    
    func createEater() {
        print("creating eater...")
        if !name.isEmpty && !email.isEmpty && !zipCode.isEmpty{
            let data = [
                "name": name,
                "email": email,
                "isActive": true,
                "isAdmin": false,
                "zipCode": zipCode
                ] as [String : Any]
            
            eatersCollectionRef.addDocument(data: data)
            print("eater created!")
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

struct CreateEaterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEaterView()
    }
}
