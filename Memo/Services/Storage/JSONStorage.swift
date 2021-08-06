//
//  JSONStorage.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation

struct JSONStorage: ServiceStorage {
    
    func loadItems() -> [Item] {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json")
        else { fatalError("Unable to find MemoryItems.json") }
        
        guard let data = try? Data(contentsOf: url)
        else { fatalError("Unable to load MemoryItems.json") }
        
        let decoder = JSONDecoder()
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data)
        else { fatalError("Failed to decode MemoryItems.json") }
        
        return savedItems
    }
}
