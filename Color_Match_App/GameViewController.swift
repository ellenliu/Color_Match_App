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
    /**
    
     Keeps track of how many times yellow was added, updated user canvas to be more yellow
     */
    @IBAction func yellowButton(_ sender: UIButton) {
        yellowCount += 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
    }
    /**
     Keeps track of how many times the yellow button was unpressed, updates the user canvas background color to be less yellow
     */
    @IBAction func yellowButtonCounter(_ sender: UIButton) {
        yellowCount -= 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
    }
   
    @IBAction func redButton(_ sender: UIButton) {
        redCount += 1
        redButton.setTitle(String(redCount), for: .normal)
    }
    
    @IBAction func redButtonCounter(_ sender: UIButton) {
        redCount -= 1
        redButton.setTitle(String(redCount), for: .normal)
    }
    
    @IBAction func blueButton(_ sender: UIButton) {
        blueCount += 1
        blueButton.setTitle(String(blueCount), for: .normal)
    }
    
    
    @IBAction func blueButtonCounter(_ sender: UIButton) {
        blueCount -= 1
        blueButton.setTitle(String(blueCount), for: .normal)
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
        
        // This can be customized based on each question
        userCanvas.backgroundColor = UIColor.red
        QuestionBank.sharedQuestionBank.addQuestions()
        let goalCanvasQuestion:Canvas = QuestionBank.sharedQuestionBank.pop()
        goalCanvas.backgroundColor = goalCanvasQuestion.color
        
        // Make round buttons
        yellowButtonDecrease.layer.borderWidth = 2
        yellowButtonDecrease.layer.borderColor = UIColor.black.cgColor
        self.applyRoundBorders(yellowButton)
        yellowButton.setTitle(String(yellowCount), for: .normal)
//        yellowButtonDecrease.setTitle("-", for: .normal)
        self.applyRoundBorders(yellowButtonDecrease)
        

        redButtonDecrease.layer.borderWidth = 2
        redButtonDecrease.layer.borderColor = UIColor.black.cgColor
        redButton.setTitle(String(redCount), for: .normal)
//        redButtonDecrease.setTitle("-", for: .normal)
        self.applyRoundBorders(redButton)
        self.applyRoundBorders(redButtonDecrease)
        
        blueButtonDecrease.layer.borderWidth = 2
        blueButtonDecrease.layer.borderColor = UIColor.black.cgColor
        blueButton.setTitle(String(blueCount), for: .normal)
//        redButtonDecrease.setTitle("-", for: .normal)
        self.applyRoundBorders(blueButton)
        self.applyRoundBorders(blueButtonDecrease)

    }
    
    func applyRoundBorders(_ object: AnyObject) {
        object.layer?.cornerRadius = object.frame.size.width / 2
        object.layer?.masksToBounds = true
    }


}
