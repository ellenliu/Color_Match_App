//
//  GameViewController.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-07.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var userCanvas: UIView!
    @IBOutlet weak var goalCanvas: UIView!
    
    var yellowCount = 0
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var yellowButtonDecrease: UIButton!
    
    var redCount = 0
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var redButtonDecrease: UIButton!
    
    var blueCount = 0
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var blueButtonDecrease: UIButton!
    var goalCanvasQuestion:Canvas = Canvas(color: UIColor(red: 255, green:255, blue:255), red:5 , green: 5, blue: 5)

    /**
    
     Keeps track of how many times yellow was added, updated user canvas to be more yellow
     */
    @IBAction func yellowButton(_ sender: UIButton) {
        yellowCount += 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
        checkUserAnswer()

    }
    /**
     Keeps track of how many times the yellow button was unpressed, updates the user canvas background color to be less yellow
     */
    @IBAction func yellowButtonCounter(_ sender: UIButton) {
        yellowCount -= 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
        isCounterValueAllowed(button: yellowButton, count: yellowCount)
        checkUserAnswer()
    }
   
    @IBAction func redButton(_ sender: UIButton) {
        redCount += 1
        redButton.setTitle(String(redCount), for: .normal)
        checkUserAnswer()
    }
    
    @IBAction func redButtonCounter(_ sender: UIButton) {
        redCount -= 1
        redButton.setTitle(String(redCount), for: .normal)
        isCounterValueAllowed(button: redButton, count: redCount)
        checkUserAnswer()
    }
    
    @IBAction func blueButton(_ sender: UIButton) {
        blueCount += 1
        blueButton.setTitle(String(blueCount), for: .normal)
        checkUserAnswer()
    }
    
    @IBAction func blueButtonCounter(_ sender: UIButton) {
        blueCount -= 1
        blueButton.setTitle(String(blueCount), for: .normal)
        isCounterValueAllowed(button: blueButton, count: blueCount)
        checkUserAnswer()
    }
    
    
    @IBAction func backToMenuButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userCanvas.layer.borderWidth = 2
        userCanvas.layer.borderColor = UIColor.black.cgColor
        goalCanvas.layer.borderWidth = 2
        goalCanvas.layer.borderColor = UIColor.black.cgColor
        
        loadFirstQuestion()
        createButtons()
    }
    
    /**
     Loads the first question and displays it
     */
    func loadFirstQuestion(){
        QuestionBank.sharedQuestionBank.addQuestions()
        goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop()
        goalCanvas.backgroundColor = goalCanvasQuestion.color
        userCanvas.backgroundColor = UIColor.white
    }
    
    /**
     Creates the 6 buttons on the screen
     */
    func createButtons(){
        self.applyRoundBorders(yellowButton)
        yellowButton.setTitle(String(yellowCount), for: .normal)
        self.applyRoundBorders(yellowButtonDecrease)
        
        redButton.setTitle(String(redCount), for: .normal)
        self.applyRoundBorders(yellowButtonDecrease)
        redButton.setTitle(String(redCount), for: .normal)

        self.applyRoundBorders(redButton)
        self.applyRoundBorders(redButtonDecrease)
        blueButton.setTitle(String(blueCount), for: .normal)

        self.applyRoundBorders(blueButton)
        self.applyRoundBorders(blueButtonDecrease)
    }
    
    /**
     Applies round borders and other beautifying traits to buttons
     */
    func applyRoundBorders(_ object: AnyObject) {
        object.layer?.cornerRadius = object.frame.size.width / 2
        object.layer?.masksToBounds = true
        object.layer?.borderWidth = 2
        object.layer?.borderColor = UIColor.black.cgColor
    }

    /**
     If user answer is correct, display animation and update goal canvas with a new goal color
     Else, update the user's canvas with the color that they're currently creating
     */
    func checkUserAnswer(){
        if yellowCount == goalCanvasQuestion.red && redCount == goalCanvasQuestion.green
            && blueCount == goalCanvasQuestion.blue {
            print("correct!!!!!")
            yellowCount = 0
            redCount = 0
            blueCount = 0
            goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop()
            goalCanvas.backgroundColor = goalCanvasQuestion.color
            userCanvas.backgroundColor = UIColor(red: 255, green:255, blue: 255)
        } else {
            userCanvas.backgroundColor = UIColor(red: yellowCount * 50, green: redCount * 50, blue: blueCount * 50)
        }
    }
    
    /**
     Checks if any color button is negative or over 5, and set the lower bound to 0 and upper bound to 5
     */
    func isCounterValueAllowed(button: UIButton, count: Int){
        if count < 0{
            button.setTitle(String(0), for: .normal)
        } else if count > 5 {
            button.setTitle(String(5), for: .normal)
        }
    }

}
