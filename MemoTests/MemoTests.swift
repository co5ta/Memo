//
//  MemoTests.swift
//  MemoTests
//
//  Created by co5ta on 07/08/2021.
//

import XCTest
@testable import Memo

class MemoTests: XCTestCase {
    
    func testServiceStorageGettingData() {
        let items = Storage.shared.loadItems()
        XCTAssertEqual(items.count, 8)
        XCTAssertEqual(items.first!.title, "Pledge of Allegiance")
        XCTAssertGreaterThan(items.first!.text.count, 10)
        XCTAssertEqual(items.last!.title, "Gettysburg Address")
        XCTAssertGreaterThan(items.last!.text.count, 10)
    }

    func testMainViewModelGettingItems() {
        let viewModel = MainViewModel()
        XCTAssertEqual(viewModel.items.count, 8) 
    }
}
