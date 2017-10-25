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
        threeWordTV.isEditable = false
        fourWordTV.isEditable = false
        fiveWordTV.isEditable = false
        sixWordTV.isEditable = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textInField = textField.text else {
            return false
        }
        messageLabel.isHidden = false
        if ttm.getWordsOriginal().contains(textInField){
            if ttm.getWordsOriginal().contains(textInField) && !ttm.getWordsCopy().contains(textInField) {
                messageLabel.text = "Already guessed the word \(textInField)"
            } else {
                messageLabel.text = "Word found!"
                addToAppropiateTV(word: textInField)
                ttm.removeWordFoundFromCopyArray(word: textInField)
                lettersLabel.text = ttm.getLettersOriginal()
                ttm.setLettersCopy(setLetters: ttm.getLettersOriginal())
                textField.text = ""
            }
        } else {
            messageLabel.text = "Can't add \(textInField)"
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            let textFieldString: String = (textField.text?.description)!
            for i in range.lowerBound..<range.upperBound {
                ttm.setLettersCopy(setLetters: ttm.getLettersCopy() + String(textFieldString[textFieldString.index(textFieldString.startIndex, offsetBy: i)]))
            }
            lettersLabel.text = ttm.getLettersCopy()
            return true
        }
        let lettersAsArray: [Character] = Array(ttm.getLettersCopy())
        if !lettersAsArray.contains(Character(string)) {
            return false
        }
        ttm.removeLetterFromLettersCopy(letter: string)
        lettersLabel.text = ttm.getLettersCopy()
        return true
    }
    
    func addToAppropiateTV(word: String){
        var content: String
        switch word.count {
        case 3:
            content = threeWordTV.text + word + "\n"
            threeWordTV.text = content
        case 4:
            content = fourWordTV.text + word + "\n"
            fourWordTV.text = content
        case 5:
            content = fiveWordTV.text + word + "\n"
            fiveWordTV.text = content
        case 6:
            content = sixWordTV.text + word + "\n"
            sixWordTV.text = content
        default:
            print("Something went wrong")
        }
    }

}

