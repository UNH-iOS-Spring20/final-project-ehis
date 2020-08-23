//
//  FoodieHomeView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct FoodieHomeView: View {
    @EnvironmentObject var sessionUser: SessionUser
    
    var body: some View {
        VStack {
            if (sessionUser.isFoodie) {
                FoodieDetailView(foodie: sessionUser.sessionUser as! FoodieUser)
            }
            else {
                ListFoodiesView()
            }
            /*
             NavigationLink(
             destination: ListFoodiesView()
             ){
             Text("List foodies")
             .font(.largeTitle)
             }.padding()
             */
        }//.navigationBarItems(leading: EditButton())
    }
}

struct FoodieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieHomeView()
    }
}

