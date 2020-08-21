//
//  AddMenuItem.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/21/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//  Stepper implementation gotten from https://programmingwithswift.com/swiftui-form-beginners-guide/

import SwiftUI
import FirebaseFirestore

struct CreateMenuView: View {
    var menuCollectionRef: CollectionReference
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var customizable = false
    @State var description = ""
    @State var size = [String](repeating: "", count: 100)
    @State var priceAsString = [String](repeating: "", count: 100)
    
    // creating price and finalSize to sort of be used to resize the array
    @State var price = [Double]()
    @State var finalSize = [String]()
    @State private var numSizes = 1
    
    var body: some View {
        Group {
            VStack (spacing: 20) {
                TextField("Name", text: $name)
                    .border(Color.black)
                
                TextField("Description", text: $description)
                    .border(Color.black)
                
                Toggle(isOn: $customizable){
                    Text("Customizable")
                }
                
                Stepper(value: $numSizes,
                        in: 1...100,
                        label: {
                            Text("How many sizes? \(self.numSizes)")
                })
                
                List {
                    ForEach (0..<self.numSizes, id: \.self) { index in
                        HStack {
                            VStack{
                                TextField("Size", text: self.$size[index])
                                    .border(Color.black)
                            }
                            Spacer()
                            VStack (alignment: .trailing){
                                TextField("Price", text: self.$priceAsString[index])
                                    .border(Color.black)
                                    .keyboardType(UIKeyboardType.decimalPad)
                            }
                        }
                    }
                }
                Button(action: {
                    self.createMenuGroup()
                }) {
                    Text("Create!")
                        .font(.largeTitle)
                }
            }.navigationBarTitle("New menu item")
            Spacer()
        }.padding()
        
    }
    func createMenuGroup() {
        print("Creating new menu entry...")
        for index in 0..<numSizes {
            if Double(priceAsString[index]) != nil{
                price.append(Double(priceAsString[index])!)
                finalSize.append(size[index])
            }
            else {
                print("failed to create item... issue with sizes/prices")
                dismiss()
                return
            }
        }
        if !name.isEmpty && !description.isEmpty && !finalSize.isEmpty && (finalSize.count == price.count){
            let data = [
                "name": name,
                "description": description,
                "customizable": customizable,
                "size": finalSize,
                "price": price
                ] as [String: Any]
            menuCollectionRef.addDocument(data: data)
            print("item successfully created!")
        }
        else{
            print("failed to create item")
        }
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        CreateMenuView(menuCollectionRef: foodiesCollectionRef.document().collection("menu"))
    }
}
