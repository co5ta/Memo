//
//  MainViewController.swift
//  Memo
//
//  Created by co5ta on 04/08/2021.
//

import UIKit

final class MainViewController: UITableViewController {

    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = viewModel.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Memory", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? MemoryViewController
        else { fatalError("Unable to instanciate MemoryViewController") }
        vc.viewModel = MemoryViewModel(item: viewModel.items[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

