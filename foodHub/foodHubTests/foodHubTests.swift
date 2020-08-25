//
//  foodHubTests.swift
//  foodHubTests
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import XCTest
import os
@testable import foodHub

class foodHubTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFoodieUserInitSucceeds(){
        let goodUser = FoodieUser(id: "1", data: [
            "name": "Good Foodie",
            "address": "Address",
            "email": "test@email.com",
            "phone": "200-TESTING",
            "isActive": true,
            "zipCode": "00000",
            "city": "Bot",
            "state": "AI"
        ])
        XCTAssertNotNil(goodUser)
        
        let userWithPhoto = FoodieUser(id: "2", data: [
            "name": "Foodie with Photo",
            "address": "Address",
            "email": "test@email.com",
            "phone": "200-TESTING",
            "isActive": true,
            "zipCode": "00000",
            "city": "Bot",
            "state": "AI",
            "photo": "https://firebasestorage.googleapis.com/v0/b/foodhub-ios.appspot.com/o/default.jpeg?alt=media&token=c8d1e459-2787-45d3-b846-af4cebc43c56"
        ])
        XCTAssertNotNil(userWithPhoto)
    }
    
    func testFoodieUserInitFails(){
        let incompleteUser = FoodieUser(id: "3", data: [
            "name": "Incomplete Foodie",
            "address": "Address",
            "email": "test@email.com",
            "phone": "200-TESTING",
            "isActive": true
        ]) // no zip, city, or state info
        XCTAssertNil(incompleteUser)
        
        let badData = FoodieUser(id: "4", data: [
            "name": "Bad data",
            "address": "Address",
            "email": "test@email.com",
            "phone": "200-TESTING",
            "isActive": "yes",
            "zipCode": 00000,
            "city": "Bot",
            "state": "AI"
        ]) // is active is string (not bool) and zip is int (not string)
        XCTAssertNil(badData)
    }
    
    func testEaterUserInitSucceeds(){
        let goodEater1 = EaterUser(id: "1", data: [
            "name": "Good Eater 1",
            "email": "test@email.com",
            "isActive": true,
            "isAdmin": false,
            "zipCode": "00000"
        ]) // photo and favorites set as defaults
        XCTAssertNotNil(goodEater1)
        
        let goodEater2 = EaterUser(id: "2", data: [
            "name": "Good Eater 2",
            "email": "test@email.com",
            "isActive": true,
            "isAdmin": false,
            "zipCode": "00000",
            "favorites": ["Dunkin", "Starbucks"]
        ])
        XCTAssertNotNil(goodEater2)
        
        let goodEater3 = EaterUser(id: "3", data: [
            "name": "Good Eater 3",
            "email": "test@email.com",
            "isActive": true,
            "isAdmin": false,
            "zipCode": "00000",
            "favorites": ["Dunkin", true, 123]
        ]) // favorites initialized to empty string array when fails to be [String]
        XCTAssertNotNil(goodEater3)
    }
    
    func testEaterUserInitFails(){
        let badEater1 = EaterUser(id: "4", data: [
            "name": "Bad Eater 1",
            "email": "test@email.com",
            "isActive": "true",
            "isAdmin": "false",
            "zipCode": "00000"
        ]) // isActive and isAdmin set as string (not bool)
        XCTAssertNil(badEater1)
        
        let badEater2 = EaterUser(id: "5", data: [
            "name": "",
            "email": "test@email.com",
            "isActive": true,
            "isAdmin": false,
            "zipCode": "00000"
        ]) // empty name should return nil
        XCTAssertNil(badEater2)
    }
    
    func testMenuItemInitSucceeds() {
        let pepperoniPizza = MenuItem(id: "1", data: [
            "name": "Pizza",
            "customizable": false,
            "description": "12' pepperoni pizza on regular crust",
            "size": ["12'"],
            "price": [5.99]
            ] as [String: Any])
        XCTAssertNotNil(pepperoniPizza)
        
        let multiSizePizzaItem = MenuItem(id: "2", data: [
        "name": "Pizza",
        "customizable": true,
        "description": "Single-topping pizza on regular crust",
        "size": ["12'", "16'"],
        "price": [5.99, 8.99]
        ] as [String: Any])
        XCTAssertNotNil(multiSizePizzaItem)
    }

    func testMenuItemInitFails() {
        let badPizzaItem = MenuItem(id: "3", data: [
        "name": "Bad pizza item",
        "customizable": false,
        "description": "Bad pizza item",
        "size": ["12'"],
        "price": [5.99, 7.99]
        ] as [String: Any])
        //pizza has one size, but two prices
        XCTAssertNil(badPizzaItem)
        
        let noNameItem = MenuItem(id: "4", data: [
        "customizable": false,
        "description": "Pizza item with no name",
        "size": ["12'"],
        "price": [5.99]
        ] as [String: Any])
        XCTAssertNil(noNameItem)
        
        let negPriceItem = MenuItem(id: "5", data: [
        "customizable": false,
        "description": "Pizza item with negative price",
        "size": ["12'"],
        "price": [-5.99]
        ] as [String: Any])
        XCTAssertNil(negPriceItem)
    }
    
    /*
    func testStoreMenuInitPass() {
        let menu = StoreMenu()
        XCTAssertEqual(0, menu.items.count)
        
        menu.items.append(MenuItem("Pizza", false, ["Standard": 9.99], [""])!)
        XCTAssertEqual(1, menu.items.count)
    }
    
    func testStoreMenuInitFails() {
        let menu = StoreMenu()
        XCTAssertEqual(0, menu.items.count)
        
        do {
            let itemToAppend = MenuItem("Pizza", false, ["": -11.50], [""])
            if itemToAppend == nil {
                throw MenuErrors.nilItem
            }
            else{
                menu.items.append(itemToAppend!)
            }
        } catch {
            os_log("\n\n\tTried to add nil item to menu... failed")
        }
        
        XCTAssertEqual(0, menu.items.count) //make sure nothing got added
    }
 */

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
