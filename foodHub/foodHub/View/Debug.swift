//
//  Debug.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 7/29/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct Debug: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: EaterView()
                )
                {
                    Text("eat food")
                        .font(.largeTitle)
                    }
                .padding(15)
                NavigationLink(
                    destination: FoodieView()
                )
                {
                    Text("sell food")
                        .font(.largeTitle)
                }
                .padding(15)
                NavigationLink(
                    destination: ShowDebug()
                )
                {
                    Text("view debug data")
                        .font(.largeTitle)
                }
                .padding(15)
            }
        .navigationBarTitle(Text("I want to..."))
        }
    }
    
    
}

/*
private func getCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        }
        else {
            print("")
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}

private func deleteCollection(collection: String){
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            print("")
            for document in querySnapshot!.documents {
                if (document.get("isAdmin") as? Bool) == true{
                    print("Skipping admin user")
                }
                else {
                    if (document.get("isActive") as? Bool) == true{
                        print("Deactivating \(document.documentID) => \(document.data())")
                        document.reference.setData(["isActive": false], merge: true)
                    }
                }
            }
        }
        print("")
    }
}
 */

struct Debug_Previews: PreviewProvider {
    static var previews: some View {
        Debug()
    }
}
