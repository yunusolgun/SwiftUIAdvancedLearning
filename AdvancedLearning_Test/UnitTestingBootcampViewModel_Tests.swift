//
//  UnitTestingBootcampViewModel_Tests.swift
//  AdvancedLearning_Test
//
//  Created by yunus olgun on 24.04.2025.
//

import XCTest
@testable import AdvancedLearning

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct_or_class]_[variable_or_function]_[ExpectedBehavior]
// Testing Structure: Given, When, Then

final class UnitTestingBootcampViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingBootcampViewModel_isPremium_shouldBeTrue() {
        let userIsPremium = true
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        XCTAssertTrue(vm.isPremium)
        
    }
    
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
        let userIsPremium = false
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        XCTAssertFalse(vm.isPremium)
        
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue() {
        let userIsPremium = Bool.random()
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        XCTAssertEqual(vm.isPremium, userIsPremium)
        
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<100 {
            let userIsPremium = Bool.random()
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
        
    }
    
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldAddItems() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        
        
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        vm.addItem(item: "")
        
        XCTAssertTrue(vm.dataArray.isEmpty)

    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldStartAsNil() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)

    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        vm.selectItem(item: UUID().uuidString)
       
        XCTAssertNil(vm.selectedItem)

    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
       
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)

    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        let loopCount = Int.random(in: 1..<1000)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
       
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)

    }
    
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_itemNotFound() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))

        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw item not found error") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.itemNotFound)
        }

    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData() {
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        let loopCount = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        XCTAssertThrowsError(try vm.saveItem(item: ""))

        XCTAssertThrowsError(try vm.saveItem(item: ""), "Should throw no data error") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
        }

    }

}
