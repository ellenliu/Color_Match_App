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
    var askedQuestions: [Canvas]
    
    private init(){
        self.unaskedQuestions = []
        self.askedQuestions = []
        //self.addQuestions()
    }
    
    class func shared() -> QuestionBank {
        return sharedQuestionBank
    }
    
    // Return a new question and add that to the list of asked questions
    func pop() -> Canvas{
        let newCanvas = unaskedQuestions.first
        unaskedQuestions.remove(at: 0)
        askedQuestions.append(newCanvas ?? Canvas(color: UIColor(red: 0, green:0, blue:0), red: 0, green: 0, blue: 0))
        return newCanvas!
    }
    
    func addQuestions () {
        //let yellowCanvas: Canvas = Canvas(color:UIColor(red: 255, green: 255, blue:0), components: [UIColor(red:255, green: 0, blue: 0): 1, UIColor(red:0, green: 255, blue: 0): 1])
        let teal: Canvas = Canvas(color: UIColor(red: 50, green: 150, blue:150), red: 1, green:3, blue: 3)
        let magenta: Canvas = Canvas(color: UIColor(red: 150, green: 50, blue:150), red: 3, green: 2, blue: 3)
        unaskedQuestions.append(teal)
        unaskedQuestions.append(magenta)
        //unaskedQuestions.append(yellowCanvas)
        //unaskedQuestions.append(yellowCanvas)
        
    }

}
