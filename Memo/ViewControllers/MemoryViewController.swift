//
//  MemoryViewController.swift
//  Memo
//
//  Created by co5ta on 05/08/2021.
//

import UIKit

final class MemoryViewController: UIViewController {

    var viewModel: MemoryViewModel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "You must provide an item before trying to show this view controller")
        showText()
    }
    
    private func showText() {
        textView.text = viewModel.item.text
    }
}
