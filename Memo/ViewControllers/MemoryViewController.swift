//
//  MemoryViewController.swift
//  Memo
//
//  Created by co5ta on 05/08/2021.
//

import UIKit
import Combine

final class MemoryViewController: UIViewController {

    var viewModel: MemoryViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    @IBOutlet weak var textView: UITextView!
    
    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.black
    ]
    
    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "You must provide an item before trying to show this view controller")
        
        viewModel.$blankCounter
            .receive(on: RunLoop.main)
            .sink { [weak self] counter in
                self?.showText()
            }
            .store(in: &cancellables)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func wordsTapped() {
        viewModel.blankCounter += 1
    }
    
    private func showText() {
        let output = NSMutableAttributedString()
        for word in viewModel.getWords() {
            let attributedText = NSMutableAttributedString(string: word.value, attributes: word.isVisible ? visibleText : invisibleText)
            output.append(attributedText)
            
        }
        textView.attributedText = output
    }
}
