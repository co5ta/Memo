//
//  DataManager.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation

struct Storage: ServiceStorage {
    
    static let shared = Storage()
    private var service: ServiceStorage = JSONStorage()
    
    func loadItems() -> [Item] {
        return service.loadItems()
    }
}
