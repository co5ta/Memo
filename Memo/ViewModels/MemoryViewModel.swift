//
//  MemoryViewModel.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation
import Combine

class MemoryViewModel {
    var item: Item
    @Published var blankCounter = 0
    
    init(item: Item) {
        self.item = item
    }
    
    func getWords() -> [(value: String, isVisible: Bool)] {
        let words = item.text.components(separatedBy: " ")
        var output: [(value: String, isVisible: Bool)] = []
        
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                output.append((value: word, isVisible: true))
            } else {
                var strippedWord = word
                var punctuation: String?
                if let char = word.last, ".,".contains(char) {
                    punctuation = String(strippedWord.removeLast())
                }
                output.append((value: strippedWord, isVisible: false))
                if let punctuation = punctuation {
                    output.append((value: punctuation, isVisible: true))
                }
            }
            output.append((value: " ", isVisible: true))
        }
        return output
    }
}
