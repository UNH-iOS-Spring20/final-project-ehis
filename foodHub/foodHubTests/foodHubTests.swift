//
//  foodHubTests.swift
//  foodHubTests
//
//  Created by Ekore, Ehiremen Alex on 2/15/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import XCTest
@testable import foodHub

class foodHubTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMenuItemInitSucceeds() {
        //let pizzaItem = MenuItem(name: "Pizza", hasSizes: false, info: ["Standard": 9.99], descriptions: [""])
        let pizzaItem = MenuItem("Pizza", false, ["Standard": 9.99], [""])
        XCTAssertNotNil(pizzaItem)
    }

    func testMenuItemInitFails() {
        let badPizzaItem = MenuItem("Pizza", false, ["Medium": 9.99, "Large": 11.99], [""]) //pizza has one size, but multiple sizes supplied
        XCTAssertNil(badPizzaItem)
        
        let noNameItem = MenuItem("", false, ["Standard": 9.99], [""])
        XCTAssertNil(noNameItem)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
