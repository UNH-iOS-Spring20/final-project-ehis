//
//  CreateEaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/6/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct CreateEaterView: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var email: String = ""
    @State var zipCode: String = ""
    @State var eaterGood: Bool = true
    @State var eaterStatus: String = ""
    
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
            
            Button(action: {
                (self.eaterGood, self.eaterStatus) = createEater(self.name, self.address, self.email, self.zipCode)
            }) {
             Text("Create!")
                .font(.largeTitle)
            }
            .padding(10)
            
            if !eaterGood {
                Text(eaterStatus)
                    .font(.body)
                    .frame(alignment: .trailing)
            }
        }
        .padding(15)
        .font(.title)
    }
}

struct CreateEaterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEaterView()
    }
}

private func createEater(_ name: String, _ address: String, _ email: String, _ zip: String)  -> (Bool, String) {
    /*
    let eaterRef = db.collection("eaters")
    let tempEater: EaterUser! = EaterUser(name, address, email, isAdmin: false, zipCode: zip)
//    let tempEater = EaterUser(id: email, name: name, address: address, email: email, isActive: true, isAdmin: false, zipCode: zip)
    var outBool: Bool = false
    var outString: String = "User already exists"
    
    if (tempEater == nil) {
        print("Unable to create eater")
        outString = "Invalid details given"
    }
    else {
        eaterRef.document(tempEater.email).getDocument {
            (document, error) in
            if !document!.exists {
                eaterRef.document(tempEater.email).setData([
                    "name": tempEater.name,
                    "email": tempEater.email,
                    "zipCode": tempEater.zipCode,
                    "isActive": true,
                    "isAdmin": false
                ], merge: true)
                if tempEater.address != "" {
                    eaterRef.document(tempEater.email).setData([
                        "address": tempEater.address
                    ], merge: true)
                }
                print("Eater created")
                outBool = true
                outString = ""
            }
            else {
                print("Unable to create eater")
                print("Eater exists")
            }
        }
    }
    return (outBool, outString)
 */
    return (true, "HardCode")
}
