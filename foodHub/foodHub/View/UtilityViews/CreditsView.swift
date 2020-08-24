//
//  CreditsView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/22/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct CreditsView: View {
    @EnvironmentObject var sessionUser: SessionUser
    @ObservedObject private var credits = FirebaseCollection<Credit> (collectionRef: creditsCollectionRef)
    
    var body: some View {
        NavigationView{
            VStack{
                Text ("Credits")
                    .font(.largeTitle)

                List {
                    ForEach (credits.items) { credit in
                        NavigationLink(
                            destination: CreditsDetailView(credit: credit)
                        ){
                            Text(credit.name)                        }
                    }
                }
                
                if sessionUser.isEater {
                    if (sessionUser.sessionUser as! EaterUser).isAdmin {
                        NavigationLink(
                            destination: AddCreditsView()
                        ){
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            }.padding(20)
        }
    }
    
    private struct CreditsDetailView: View {
        var credit: Credit
        
        var body: some View {
            VStack (alignment: .leading) {
                Text("\(credit.name)\n")
                Text("\(credit.description)\n")
                Text("\(dateAsString(date: credit.date))\n")
                Spacer()
            }
        }
        
        private func dateAsString (date: Timestamp) -> String{
            // gets the date from the given timestamp
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: date.dateValue())
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
