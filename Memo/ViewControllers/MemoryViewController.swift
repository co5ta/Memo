//
//  MemoryViewController.swift
//  Memo
//
//  Created by co5ta on 05/08/2021.
//

import UIKit

final class MemoryViewController: UIViewController {

    var memoryItem: MemoryItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(memoryItem != nil, "You must provide an item before trying to show this view controller")
        showText()
    }
    
    private func showText() {
        textView.text = memoryItem.text
    }
}
