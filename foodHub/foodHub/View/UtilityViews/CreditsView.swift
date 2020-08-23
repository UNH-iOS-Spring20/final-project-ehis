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
    @ObservedObject private var credits = FirebaseCollection<Credit> (collectionRef: Firestore.firestore().collection("credits"))
    
    var body: some View {
        List {
            ForEach (credits.items) { credit in
                NavigationLink(
                    destination: CreditsDetailView(credit: credit)
                ){
                    Text(credit.name)
                }
            }
        }
    }
    
    private struct CreditsDetailView: View {
        var credit: Credit
        
        var body: some View {
            VStack (alignment: .leading) {
                Text(credit.name)
                Text(credit.description)
                Text(dateAsString(date: credit.date))
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
