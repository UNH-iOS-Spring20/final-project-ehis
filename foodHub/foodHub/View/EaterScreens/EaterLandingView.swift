//
//  EaterView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 3/1/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EaterLandingView: View {
    var body: some View {
        VStack {
            NavigationLink(
                destination: CreateEaterView()
            ){
                Text("New eater")
                    .font(.largeTitle)
            }
            .padding(10)
            
            NavigationLink(
                destination: SelectEaterView()
            ){
                Text("Select existing eater")
                    .font(.largeTitle)
            }
            .padding(10)
        }
        //presentationMode.wrappedValue.dismiss()
    }
    
    struct SelectEaterView: View {
        @EnvironmentObject var sessionUser: SessionUser
        @Environment(\.presentationMode) var presentationMode
        @ObservedObject private var eaters = FirebaseCollection<EaterUser> (collectionRef: eatersCollectionRef)
        
        @State private var showingConfirmLogin = false
        
        var body: some View {
            VStack{
                Text("Select your user: ")
                List {
                    ForEach(eaters.items) { eater in
                        
                        Button(action: {
                            self.setSessionEater(eater: eater)
                        }){
                            HStack{
                                ImageViewController(imageUrl: eater.data["photo"] as! String)
                                Text(eater.data["name"] as! String)
                            }
                        }
                    }
                }
            }.alert(isPresented: $showingConfirmLogin){
                Alert(title: Text("Successful Login!"), message: Text("Session user set as \((sessionUser.sessionUser as! EaterUser).name)"), dismissButton: .default(Text("OK ")))
            }
        }
        
        private func setSessionEater(eater: EaterUser) {
            sessionUser.setEater(eater: eater)
            self.showingConfirmLogin.toggle()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EaterView_Previews: PreviewProvider {
    static var previews: some View {
        EaterLandingView()
    }
}

