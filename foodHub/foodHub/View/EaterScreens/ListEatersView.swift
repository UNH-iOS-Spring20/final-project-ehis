//
//  ListEatersView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ListEatersView: View {
    @ObservedObject private var eaters = FirebaseCollection<EaterUser> (collectionRef: eatersCollectionRef)
    var body: some View {
        VStack{
            List {
                ForEach(eaters.items) { eater in
                    if eater.data["isActive"] as! Bool {
                        NavigationLink(destination: EaterDetailView(eater: eater)){
                            HStack{
                                ImageViewController(imageUrl: eater.data["photo"] as! String)
                                Text(eater.data["name"] as! String)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Active eaters")
        }
    }
}

struct ListEatersView_Previews: PreviewProvider {
    static var previews: some View {
        ListEatersView()
    }
}
