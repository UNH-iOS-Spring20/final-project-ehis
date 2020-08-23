//
//  AppendMenuView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EditMenuView: View {
    var menuCollectionRef: CollectionReference
    @ObservedObject var menuItem: MenuItem
    
    @State var numSizes = 1
    @State var size = [String](repeating: "", count: 100)
    @State var priceAsString = [String](repeating: "", count: 100)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack (spacing: 20) {
                TextField("Name", text: $menuItem.name)
                    .border(Color.black)
                
                TextField("Description", text: $menuItem.description)
                    .border(Color.black)
                
                Toggle(isOn: $menuItem.customizable){
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
                    self.appendMenu()
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }.onAppear{self.initArrays()}
        }
    }
    
    func initArrays (){
        numSizes = menuItem.size.count
        for index in 0..<numSizes {
            size[index] = menuItem.size[index]
            priceAsString[index] = String(menuItem.price[index])
        }
    }
    func appendMenu(){
        //clear sizes and prices first to avoid duplicates and ensure deletes occur
        
        menuItem.size.removeAll()
        menuItem.price.removeAll()
        for index in 0..<numSizes {
            if Double(priceAsString[index]) != nil{
                menuItem.price.append(Double(priceAsString[index])!)
                menuItem.size.append(size[index])
            }
            else {
                print("failed to create item... issue with sizes/prices")
                dismiss()
                return
            }
        }

        menuCollectionRef.document(menuItem.id).setData(menuItem.data)
        
        print("item successfully updated")
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AppendMenuView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuView(menuCollectionRef: foodiesCollectionRef.document().collection("menu"), menuItem: MenuItem.example)
    }
}
