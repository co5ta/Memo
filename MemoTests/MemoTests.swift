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
  
    func testItemTextBlanking() {
        let items = Storage.shared.loadItems()
        let viewModel = MemoryViewModel(item: items[0])
        let words = viewModel.getWords().filter { !" .,".contains($0.value) && $0.isVisible }
        let visibleWords = words.filter { $0.isVisible }
        let invisibleWords = words.filter { !$0.isVisible }
        XCTAssertEqual(visibleWords.count, 0)
        XCTAssertEqual(invisibleWords.count, words.count)
    }
    
    func testItemTextBlankingWithBlankCounterNotZero() {
        let items = Storage.shared.loadItems()
        let viewModel = MemoryViewModel(item: items[0])
        viewModel.blankCounter = 5
        let words = viewModel.getWords().filter { !" .,".contains($0.value) && $0.isVisible }
        let visibleWords = words.filter { $0.isVisible }
        let invisibleWords = words.filter { !$0.isVisible }
        XCTAssertEqual(visibleWords.count, viewModel.blankCounter)
        XCTAssertEqual(invisibleWords.count, words.count - viewModel.blankCounter)
    }
}
