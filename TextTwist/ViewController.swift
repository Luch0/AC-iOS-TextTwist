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
        messageLabel.isHidden = true
        threeWordTV.isUserInteractionEnabled = false
        fourWordTV.isUserInteractionEnabled = false
        fiveWordTV.isUserInteractionEnabled = false
        sixWordTV.isUserInteractionEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textInField = textField.text else {
            return false
        }
        messageLabel.isHidden = false
        if ttm.getWordsOriginal().contains(textInField){
            if ttm.getWordsOriginal().contains(textInField) && !ttm.getWordsCopy().contains(textInField) {
                messageLabel.text = "Already guessed that word"
            } else {
                messageLabel.text = "YES"
                addToAppropiateTV(word: textInField)
                ttm.removeWordFoundFromCopyArray(word: textInField)
                lettersLabel.text = ttm.getLettersOriginal()
                ttm.setLettersCopy(setLetters: ttm.getLettersOriginal())
                textField.text = ""
            }
        } else {
            messageLabel.text = "NO"
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
//            guard let lastCharacter = textField.text?.last?.description else {
//                return false
//            }
//            ttm.setLettersCopy(setLetters: ttm.getLettersCopy() + lastCharacter)
//            lettersLabel.text = ttm.getLettersCopy()
            
//            let textFieldString: String = (textField.text?.description)!
//            for i in range.lowerBound..<range.upperBound {
//                ttm.setLettersCopy(setLetters: ttm.getLettersCopy() + String(textFieldString[textFieldString.index(textFieldString.startIndex, offsetBy: i)]))
//            }
            return true
        }
        var lettersAsArray: [Character] = Array(ttm.getLettersCopy())
        if !lettersAsArray.contains(Character(string)) {
            return false
        }
        for i in 0..<lettersAsArray.count {
            if String(lettersAsArray[i]) == string {
                lettersAsArray.remove(at: i)
                break
            }
        }
        ttm.setLettersCopy(setLetters: String(lettersAsArray))
        lettersLabel.text = ttm.getLettersCopy()
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
        case 6:
            content = sixWordTV.text + "\n" + word
            sixWordTV.text = content
        default:
            print("Something went wrong")
        }
    }

}

