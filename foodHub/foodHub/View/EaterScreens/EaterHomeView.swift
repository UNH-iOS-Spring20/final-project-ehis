//
//  EaterHomeView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/12/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct EaterHomeView: View {
    @EnvironmentObject var sessionUser: SessionUser
    
    var body: some View {
        NavigationView{
            VStack {
                ListFoodiesView()
            }
        }
    }
}

struct EaterHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EaterHomeView()
    }
}
