//
//  MainViewModel.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation

struct MainViewModel {
    var items: [Item] = []
    
    init() {
        items = Storage.shared.loadItems()
    }
}
