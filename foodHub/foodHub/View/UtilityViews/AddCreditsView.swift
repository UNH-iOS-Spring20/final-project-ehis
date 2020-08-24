//
//  AddCreditsView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/24/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct AddCreditsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var description: String = ""
    @State var date = Date()
    var body: some View {
        Group{
            VStack (spacing: 20) {
                TextField("Name", text: $name)
                    .border(Color.black)
                
                TextField("description", text: $description)
                    .border(Color.black)
                
                Form {
                    DatePicker("Date accessed", selection: $date, displayedComponents: .date)
                }
                
                
            }.font(.title)
                .navigationBarTitle("New Credit")
            Spacer()
            
            Button(action: {
                self.addToCredits()
            }) {
                Text("Save")
                    .font(.largeTitle)
            }
        }.padding()
    }
    
    func addToCredits(){
        print("adding to credits...")
        if !name.isEmpty && !description.isEmpty {
            let data = [
                "name": name,
                "description": description,
                "date": date
                ] as [String: Any]
            
            creditsCollectionRef.addDocument(data: data)
            print("credit successfully added!")
        }
        
        print("failed to add credit")
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddCreditsView_Previews: PreviewProvider {
    static var previews: some View {
        AddCreditsView()
    }
}
