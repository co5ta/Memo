//
//  ViewController.swift
//  Memo
//
//  Created by co5ta on 04/08/2021.
//

import UIKit

class ViewController: UITableViewController {

    var items: [MemoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    func loadItems() {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json")
        else { fatalError("Unable to find MemoryItems.json") }
        
        guard let data = try? Data(contentsOf: url)
        else { fatalError("Unable to load MemoryItems.json") }
        
        let decoder = JSONDecoder()
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data)
        else { fatalError("Failed to decode MemoryItems.json") }
        items = savedItems
    }

}

