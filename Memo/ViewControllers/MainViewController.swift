//
//  MainViewController.swift
//  Memo
//
//  Created by co5ta on 04/08/2021.
//

import UIKit

final class MainViewController: UITableViewController {

    var items: [MemoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    private func loadItems() {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json")
        else { fatalError("Unable to find MemoryItems.json") }
        
        guard let data = try? Data(contentsOf: url)
        else { fatalError("Unable to load MemoryItems.json") }
        
        let decoder = JSONDecoder()
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data)
        else { fatalError("Failed to decode MemoryItems.json") }
        items = savedItems
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Memory", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? MemoryViewController
        else { fatalError("Unable to instanciate MemoryViewController") }
        vc.memoryItem = items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

