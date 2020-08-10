//
//  FirebaseSession.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 7/29/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession() // singleton

class FirebaseSession: ObservableObject {
    @Published var foodies = [FoodieUser]()
    @Published var eaters = [EaterUser]()
    @Published var menuItemGroups = [MenuItemGroup]()
    @Published var menuItemUnits = [MenuItemUnit]()
    let db = Firestore.firestore()
    
    init() {
        readData()
    }
    
    func readData() {
        loadFoodies()
        loadEaters()
        loadMenuItemUnits()
        loadMenuGroups()
    }
    
    //----------------------------------------------------
    func loadFoodies() {
        db.collection("foodies").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New foodie: \(diff.document.data())")
                    let nameRef = diff.document.get("menuItems") as? [DocumentReference] ?? []
                    var itemNames = [String]()
                    for ref in nameRef {
                        itemNames.append(ref.path)
                    }
                    let foodie: FoodieUser? = FoodieUser(allFields: diff.document.documentID,
                    name: diff.document.get("name") as! String,
                    address: diff.document.get("address") as? String,
                    email: diff.document.get("email") as? String,
                    isActive: diff.document.get("isActive") as! Bool,
                    zipCode: diff.document.get("zipCode") as! String,
                    city: diff.document.get("city") as? String,
                    state: diff.document.get("state") as? String,
                    menuItems: itemNames)
                    
                    if foodie != nil {
                        self.foodies.append(foodie!)
                    }
                    else {
                        print("nil foodie encountered")
                    }
                }
            }
        }
    }
    
    //----------------------------------------------------
    func loadEaters() {
        db.collection("eaters").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New eater: \(diff.document.data())")
                    
                    let eater = EaterUser(allFields: diff.document.documentID,
                    name: diff.document.get("name") as! String,
                    address: diff.document.get("address") as? String ?? "",
                    email: diff.document.get("email") as! String,
                    isActive: diff.document.get("isActive") as! Bool,
                    isAdmin: diff.document.get("isAdmin") as! Bool,
                    zipCode: diff.document.get("zipCode") as! String)
                    
                    if eater != nil {
                        self.eaters.append(eater!)
                    }
                    else {
                        print("nil eater encountered")
                    }
                }
            }
        }
    }
    
    //----------------------------------------------------
    func loadMenuItemUnits() {
        db.collection("menuItemUnits").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New precise menu item added: \(diff.document.data())")
                    
                    let itemUnit = MenuItemUnit(full: diff.document.documentID,
                        size: diff.document.get("size") as! String,
                        price: diff.document.get("price") as! Double,
                        description: diff.document.get("description") as! String)
                    
                    self.menuItemUnits.append(itemUnit)
                }
            }
        }
    }
    
    //----------------------------------------------------
    func loadMenuGroups() {
        db.collection("menuItems").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print ("New item group added: \(diff.document.data())")
                    let nameRef = diff.document.get("info") as? [DocumentReference] ?? []
                    var info = [String]()
                    for ref in nameRef {
                        info.append(ref.path)
                    }
                    let itemGroup = MenuItemGroup(multiSize: diff.document.documentID,
                        name: diff.document.get("name") as! String,
                        owner: diff.document.get("owner") as! String,
                        hasSizes: diff.document.get("hasSizes") as! Bool,
                        customizable: diff.document.get("customizable") as! Bool,
                        myInfo: info)
    
                    self.menuItemGroups.append(itemGroup)
                }
            }
        }
    }
    
}
