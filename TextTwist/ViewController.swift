//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var lettersLabel: UILabel!
    @IBOutlet weak var threeWordTV: UITextView!
    @IBOutlet weak var fourWordTV: UITextView!
    @IBOutlet weak var fiveWordTV: UITextView!
    @IBOutlet weak var sixWordTV: UITextView!
    
    var ttm = TextTwistModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessTextField.delegate = self
        lettersLabel.text = ttm.getLettersCopy()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textInField = textField.text else {
            return false
        }
        if ttm.getWordsCopy().contains(textInField){
            messageLabel.text = "YES"
            addToAppropiateTV(word: textInField)
            ttm.removeWordFound(word: textInField)
        } else {
            messageLabel.text = "NO"
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        let lettersAsArray: [Character] = Array(ttm.getLettersCopy())
        if !lettersAsArray.contains(Character(string)) {
            return false
        }
        return true
    }
    
    func addToAppropiateTV(word: String){
        var content: String
        switch word.count {
        case 3:
            content = threeWordTV.text + "\n" + word
            threeWordTV.text = content
        case 4:
            content = fourWordTV.text + "\n" + word
            fourWordTV.text = content
        case 5:
            content = fiveWordTV.text + "\n" + word
            fiveWordTV.text = content
        default:
            content = sixWordTV.text + "\n" + word
            sixWordTV.text = content
        }
    }

}

