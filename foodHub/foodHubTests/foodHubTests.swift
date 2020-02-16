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

    func testMenuItemInitSucceeds() {
        let pizzaItem = MenuItem("Pizza", false, ["Standard": 9.99], [""])
        XCTAssertNotNil(pizzaItem)
        
        let multiSizePizzaItem = MenuItem("Pizza", true, ["Medium": 9.99, "Large": 11.99], ["Medium pizza", "Large pizza"])
        XCTAssertNotNil(multiSizePizzaItem)
    }

    func testMenuItemInitFails() {
        let badPizzaItem = MenuItem("Pizza", false, ["Medium": 9.99, "Large": 11.99], ["", ""]) //pizza has one size, but multiple sizes supplied
        XCTAssertNil(badPizzaItem)
        
        let noNameItem = MenuItem("", false, ["Standard": 9.99], [""])
        XCTAssertNil(noNameItem)
        
        let negPriceItem = MenuItem("Pizza", false, ["": -11.50], [""])
        XCTAssertNil(negPriceItem)
    }
    
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
