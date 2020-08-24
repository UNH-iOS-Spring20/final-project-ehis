//
//  ContentView.swift
//  foodHub
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//
// back on 07/28 :)
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Content view")
    }
    /*
    @EnvironmentObject var sessionUser: SessionUser
    
    @ObservedObject private var foodies = FirebaseCollection<FoodieUser> (collectionRef: foodiesCollectionRef)
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                NavigationLink(
                    destination: EaterLandingView()
                    )
                {
                    Text("eat food")
                        .font(.largeTitle)
                }
                NavigationLink(
                    destination: FoodieLandingView()
                    )
                {
                    Text("sell food")
                        .font(.largeTitle)
                }
            }.navigationBarTitle("FoodHub", displayMode: .inline)
        }
    }
 */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
