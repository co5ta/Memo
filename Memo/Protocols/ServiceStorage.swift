//
//  Storage.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation

protocol ServiceStorage {
    func loadItems() -> [Item]
}
