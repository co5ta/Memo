//
//  Item.swift
//  Memo
//
//  Created by co5ta on 06/08/2021.
//

import Foundation

protocol Item: Codable {
    var title: String { get set }
    var text: String { get set }
}
