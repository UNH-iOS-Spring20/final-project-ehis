//
//  EditEaterView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct EditEaterView: View {
    @ObservedObject var eater: EaterUser
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group{
            VStack (spacing: 20) {
                TextField("Name", text: $eater.name)
                    .border(Color.black)
                
                TextField("email", text: $eater.email)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.emailAddress)
                    .autocapitalization(UITextAutocapitalizationType.none)
                
                TextField("Zip Code", text: $eater.zipCode)
                    .border(Color.black)
                    .keyboardType(UIKeyboardType.decimalPad)
                
                Button(action: {
                    self.updateEater()
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }.font(.title)
                .navigationBarTitle("Create user")
            Spacer()
        }.padding()
    }
    
    func updateEater() {
        print("updating eater...")
        if !eater.name.isEmpty && !eater.email.isEmpty && !eater.zipCode.isEmpty{
            eatersCollectionRef.document(eater.id).setData(eater.data)
            print("eater updated!")
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

struct EditEaterView_Previews: PreviewProvider {
    static var previews: some View {
        EditEaterView(eater: EaterUser.example)
    }
}
