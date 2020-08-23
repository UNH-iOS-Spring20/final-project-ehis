//
//  EaterDetailView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

/*
 @Published var favorites: Set<String>
 */
struct EaterDetailView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @ObservedObject var eater: EaterUser
    
    init(eater: EaterUser) {
        self.eater = eater
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack{
                ImageViewController(imageUrl: eater.photo)
                
                Text(eater.name)
                    .font(.title)
            }
            HStack {
                Text("Active: ")
                Image(systemName: (eater.isActive ? "checkmark.square" : "square"))
            }
            HStack {
                Text("Admin: ")
                Image(systemName: (eater.isAdmin ? "checkmark.square" : "square"))
            }
            
            HStack{
                Text("Email: ")
                Text(eater.email)
            }
            
            HStack{
                Text("Zipcode: ")
                Text(eater.zipCode)
            }
            
            List {
                Section(header: Text("Favorite Foodies")) {
                    ForEach(eater.favorites, id: \.self) { index in
                        Text(index)
                    }
                }
            }
            if sessionUser.validateEater(eater: eater) {
                NavigationLink(
                    destination: EditEaterView(eater: self.eater)
                ){
                    Text("Edit info")
                }
            }
            
        }.padding()
            .font(.body).padding()
            .navigationBarTitle("\(foodie.name)'s Menu")
    }
}

struct EaterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EaterDetailView(eater: EaterUser.example)
    }
}
