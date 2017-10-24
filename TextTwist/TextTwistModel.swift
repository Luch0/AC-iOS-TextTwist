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
    
    init () {
        let randInt = Int(arc4random_uniform(UInt32(WordData.allInfo.count)))
        self.chosenWordData = WordData.allInfo[randInt]
        self.copyArrayWords = chosenWordData.words
    }
    
    func getWordCount() -> Int {
        return chosenWordData.wordCount
    }
    func getLetters() -> String {
        return chosenWordData.letters
    }
    func getWords() -> [String] {
        return copyArrayWords
    }
    
    func removeWordFound(word: String) {
        copyArrayWords = copyArrayWords.filter{$0 != word}
    }
    
}
