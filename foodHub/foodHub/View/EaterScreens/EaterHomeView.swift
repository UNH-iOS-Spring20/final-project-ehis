//
//  EaterHomeView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct EaterHomeView: View {
    var body: some View {
        VStack {
            ListFoodiesView()
            /*
             NavigationLink(
             destination: ListFoodiesView()
             ){
             Text("List foodies")
             .font(.largeTitle)
             }.padding()
             */
        }
    }
}

struct EaterHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EaterHomeView()
    }
}
