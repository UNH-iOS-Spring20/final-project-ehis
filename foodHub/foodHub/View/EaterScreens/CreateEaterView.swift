//
//  CreateEaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateEaterView: View {
    @EnvironmentObject var sessionUser: SessionUser
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
            
            let docID = eatersCollectionRef.addDocument(data: data).documentID
            // docID will be used to initialize sessionUser
            
            //only change session user if user isn't admin
            if !self.sessionUser.isAdmin(){
                self.sessionUser.setEater(eater: EaterUser(id: docID, data: data)!)
            }
            
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
