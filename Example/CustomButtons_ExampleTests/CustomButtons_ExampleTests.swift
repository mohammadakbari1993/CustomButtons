//
//  CustomButtons_ExampleTests.swift
//  CustomButtons_ExampleTests
//
//  Created by Bahman on 9/16/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import CustomButtons_Example

class CustomButtons_ExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginValitaor() {
        
        var model = LoginModel(userName: "", password: "")
        
        do {
            try LoginValidator.verify(model: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, LoginValidationErrors.userNameIsEmpty.localizedDescription)
        }
        
        model.userName = "Mohammad"
        
        do {
            try LoginValidator.verify(model: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, LoginValidationErrors.passwordIsEmpty.localizedDescription)
        }
        
        
        model.password = "1234"
        
        do {
            try LoginValidator.verify(model: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, LoginValidationErrors.passwordIsTooShort.localizedDescription)
        }
        

        model.password = "12345678900"
        
        do {
            try LoginValidator.verify(model: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, LoginValidationErrors.passwordIsTooLong.localizedDescription)
        }
        
    }
    
    func testRegisterValidator() {
        
        var model = User(name: "", userName: "", password: "")
        
        do {
            try RegisterValidator.verify(user: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, RegisterValidationErrors.nameIsEmpty.localizedDescription)
        }
        
        model.name = "Mohammad"
       
        do {
            try RegisterValidator.verify(user: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, RegisterValidationErrors.userNameIsEmpty.localizedDescription)
        }
        
        
        model.userName = "Mohammad"
       
        do {
            try RegisterValidator.verify(user: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, RegisterValidationErrors.passwordIsEmpty.localizedDescription)
        }
        
        
        model.password = "1234"
        
        do {
            try RegisterValidator.verify(user: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, RegisterValidationErrors.passwordIsTooShort.localizedDescription)
        }
        

        model.password = "12345678900"
        
        do {
            try RegisterValidator.verify(user: model)
        } catch(let error) {
            XCTAssertEqual(error.localizedDescription, RegisterValidationErrors.passwordIsTooLong.localizedDescription)
        }
        
    }

}
