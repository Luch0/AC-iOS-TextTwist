//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    var chosenWordData: TestTwistInfo
    var copyArrayWords: [String]
    var copyLetters: String
    
    init () {
        let randInt = Int(arc4random_uniform(UInt32(WordData.allInfo.count)))
        self.chosenWordData = WordData.allInfo[randInt]
        self.copyArrayWords = chosenWordData.words
        self.copyLetters = chosenWordData.letters
    }
    
    func getWordCount() -> Int {
        return chosenWordData.wordCount
    }
    
    func getLettersCopy() -> String {
        return self.copyLetters
    }
    
    func getWordsCopy() -> [String] {
        return self.copyArrayWords
    }
    
    func getLettersOriginal() -> String {
        return chosenWordData.letters
    }
    
    func getWordsOriginal() -> [String] {
        return chosenWordData.words
    }
    
    func setLettersCopy(setLetters: String) {
        self.copyLetters = setLetters
    }
    
    func removeWordFoundFromCopyArray(word: String) {
        copyArrayWords = copyArrayWords.filter{$0 != word}
    }
    
    func removeLetterFromLettersCopy(letter: String) {
        var lettersAsArray: [Character] = Array(copyLetters)
        for i in 0..<lettersAsArray.count {
            if String(lettersAsArray[i]) == letter {
                lettersAsArray.remove(at: i)
                break
            }
        }
        self.copyLetters = String(lettersAsArray)
    }
}
