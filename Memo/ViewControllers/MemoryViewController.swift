//
//  MemoryViewController.swift
//  Memo
//
//  Created by co5ta on 05/08/2021.
//

import UIKit

final class MemoryViewController: UIViewController {

    var viewModel: MemoryViewModel!
    var blankCounter = 0
    
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
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    private func showText() {
        let words = viewModel.item.text.components(separatedBy: " ")
        let space = NSAttributedString(string: " ", attributes: visibleText)
        let output = NSMutableAttributedString()
        
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                output.append(NSMutableAttributedString(string: "\(word)", attributes: visibleText))
            } else {
                var strippedWord = word
                var punctuation: String?
                if let char = word.last, ",;".contains(char) {
                    punctuation = String(strippedWord.removeLast())
                }
                output.append(NSMutableAttributedString(string: "\(strippedWord)", attributes: invisibleText))
                if let punctuation = punctuation {
                    output.append(NSMutableAttributedString(string: "\(punctuation)", attributes: visibleText))
                }
            }
            output.append(space)
        }
        textView.attributedText = output
    }
    
    @objc
    private func wordsTapped() {
        blankCounter += 1
        showText()
    }
}
