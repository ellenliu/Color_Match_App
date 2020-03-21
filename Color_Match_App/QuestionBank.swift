//
//  QuestionBank.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-09.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import UIKit

/**
 A singleton to be shared by the app. Contains all the "levels" in the game
 */
class QuestionBank {
    static let sharedQuestionBank: QuestionBank = {
        let instance = QuestionBank()
        return instance
    }()
    
    var unaskedQuestions: [Canvas]
    
    private init(){
        self.unaskedQuestions = []
    }
    
    class func shared() -> QuestionBank {
        return sharedQuestionBank
    }
    
    // Return a new question at the given index
    func pop(index: Int) -> Canvas{
        return unaskedQuestions[index]
    }
    
    /**
     Hardcoded answers to the questions
     */
    func addQuestions () {
        let teal: Canvas = Canvas(color: UIColor(red: 50, green: 150, blue:150), red: 1, green:3, blue: 3)
        let magenta: Canvas = Canvas(color: UIColor(red: 150, green: 50, blue:150), red: 3, green: 0, blue: 3)
        let orange: Canvas = Canvas(color: UIColor(red: 200, green: 100, blue:0), red: 4, green: 2, blue: 0)
        let pink: Canvas = Canvas(color: UIColor(red: 250, green: 150, blue:200), red: 5, green: 3, blue: 4)
        let lightBlue = Canvas(color: UIColor(red: 50, green: 200, blue:250), red: 1, green:4, blue: 5)
        let lightGreen = Canvas(color: UIColor(red: 200, green: 250, blue:200), red: 4, green:5, blue: 4)
        let lightPurple = Canvas(color: UIColor(red: 150, green: 150, blue:250), red: 3, green:3, blue: 5)
        let darkYellow = Canvas(color: UIColor(red: 200, green: 200, blue:0), red: 4, green:4, blue: 1)
        let redOrange = Canvas(color: UIColor(red: 250, green: 100, blue:100), red: 5, green:2, blue: 2)
        
        unaskedQuestions.append(teal)
        unaskedQuestions.append(magenta)
        unaskedQuestions.append(orange)
        unaskedQuestions.append(pink)
        unaskedQuestions.append(lightBlue)
        unaskedQuestions.append(lightGreen)
        unaskedQuestions.append(lightPurple)
        unaskedQuestions.append(darkYellow)
        unaskedQuestions.append(redOrange)
    }
    


}
