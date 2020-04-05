//
//  GameViewController.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-07.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController, CAAnimationDelegate {

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
    
    let gradient = CAGradientLayer()
    var currentGradient: Int = 0
    var gradientSet = [[CGColor]]()
    
    lazy var popupView: PopupView = {
        let popupView = PopupView()
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.layer.cornerRadius = 5
        popupView.delegate = self
        return popupView
    }()
    
    fileprivate let blurView: UIVisualEffectView = {
        var blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let userHexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        //label.text = "#FFFFFF"
        label.textColor = UIColor.black
        return label
    }()
    
    fileprivate let goalHexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        //label.text = "#FFFFFF"
        label.textColor = UIColor.black
        return label
    }()
    
    /**
     Keeps track of how many times yellow was added, updated user canvas to be more yellow
     */
    @IBAction func yellowButton(_ sender: UIButton) {
        yellowCount += 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
        isCounterValueAllowed(button: yellowButton, count: &yellowCount)
        checkUserAnswer()
    }
    
    /**
     Keeps track of how many times the yellow button was unpressed, updates the user canvas background color to be less yellow
     */
    @IBAction func yellowButtonCounter(_ sender: UIButton) {
        yellowCount -= 1
        yellowButton.setTitle(String(yellowCount), for: .normal)
        isCounterValueAllowed(button: yellowButton, count: &yellowCount)
        checkUserAnswer()
    }
   
    @IBAction func redButton(_ sender: UIButton) {
        redCount += 1
        redButton.setTitle(String(redCount), for: .normal)
        isCounterValueAllowed(button: redButton, count: &redCount)
        checkUserAnswer()
    }
    
    @IBAction func redButtonCounter(_ sender: UIButton) {
        redCount -= 1
        redButton.setTitle(String(redCount), for: .normal)
        isCounterValueAllowed(button: redButton, count: &redCount)
        checkUserAnswer()
    }
    
    @IBAction func blueButton(_ sender: UIButton) {
        blueCount += 1
        blueButton.setTitle(String(blueCount), for: .normal)
        isCounterValueAllowed(button: blueButton, count: &blueCount)
        checkUserAnswer()
    }
    
    @IBAction func blueButtonCounter(_ sender: UIButton) {
        blueCount -= 1
        blueButton.setTitle(String(blueCount), for: .normal)
        isCounterValueAllowed(button: blueButton, count: &blueCount)
        checkUserAnswer()
    }
    
    
    @IBAction func backToMenuButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCanvas.layer.borderWidth = 2
        userCanvas.layer.borderColor = UIColor.black.cgColor
        userCanvas.layer.cornerRadius = 5
        goalCanvas.layer.borderWidth = 2
        goalCanvas.layer.borderColor = UIColor.black.cgColor
        goalCanvas.layer.cornerRadius = 5
        
        view.addSubview(blurView)
        blurView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurView.alpha = 0
        
        userCanvas.addSubview(userHexLabel)
        userHexLabel.bottomAnchor.constraint(equalTo: userCanvas.bottomAnchor, constant: -12).isActive = true
        userHexLabel.rightAnchor.constraint(equalTo: userCanvas.rightAnchor, constant: -12).isActive = true
        
        goalCanvas.addSubview(goalHexLabel)
        goalHexLabel.bottomAnchor.constraint(equalTo: goalCanvas.bottomAnchor, constant: -12).isActive = true
        goalHexLabel.rightAnchor.constraint(equalTo: goalCanvas.rightAnchor, constant: -12).isActive = true
        
        loadFirstQuestion()
        createButtons()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        createGradientView(goalCanvasQuestion.color)
    }
    
    /**
     Loads the first question and displays it along with initial hex values and gradient
     */
    func loadFirstQuestion(){
        QuestionBank.sharedQuestionBank.addQuestions()
        if let index = UserDefaults.standard.string(forKey: "levelIndex") {
            goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop(index: Int(index) ?? 0)
        } else {
            goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop(index: 0)
            UserDefaults.standard.set(0, forKey: "levelIndex")
        }
        goalCanvas.backgroundColor = goalCanvasQuestion.color
        userCanvas.backgroundColor = UIColor.white
        userHexLabel.text = "#FFFFFF"
        goalHexLabel.text = convertToHex(goalCanvasQuestion.color)
    }
    
    /**
     Creates the 6 buttons on the screen with effects
     */
    func createButtons(){
        yellowButton.setTitle(String(yellowCount), for: .normal)
        self.applyBorders(yellowButtonDecrease)
        self.applyShadow(yellowButton)
        
        redButton.setTitle(String(redCount), for: .normal)
        self.applyBorders(redButtonDecrease)
        self.applyShadow(redButton)
        
        blueButton.setTitle(String(blueCount), for: .normal)
        self.applyBorders(blueButtonDecrease)
        self.applyShadow(blueButton)
    }
    
    /**
     Applies  borders and other beautifying traits to bottom buttons
     */
    func applyBorders(_ button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 5
    }
    
    /**
     Applies shadow effect to buttons
     */
    func applyShadow(_ button: UIButton){
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
    }

    /**
     If user answer is correct, display animation, update goal canvas with a new goal color, and update user's current level in user default
     Else, update the user's canvas with the color that they're currently creating
     */
    func checkUserAnswer(){
        if yellowCount == goalCanvasQuestion.red && redCount == goalCanvasQuestion.green
            && blueCount == goalCanvasQuestion.blue {
            displayPopup()
            yellowCount = 0
            redCount = 0
            blueCount = 0
            yellowButton.setTitle(String(yellowCount), for: .normal)
            redButton.setTitle(String(yellowCount), for: .normal)
            blueButton.setTitle(String(yellowCount), for: .normal)
            if let index: Int = Int(UserDefaults.standard.string(forKey: "levelIndex")!) {
                if index == QuestionBank.sharedQuestionBank.size() - 1 {
                    // Looping back to beginning
                    UserDefaults.standard.set(0, forKey: "levelIndex")
                    goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop(index: 0)
                } else {
                    let newIndex: Int = index + 1
                    UserDefaults.standard.set(newIndex, forKey: "levelIndex")
                    goalCanvasQuestion = QuestionBank.sharedQuestionBank.pop(index: newIndex)
                }
            }
            goalCanvas.backgroundColor = goalCanvasQuestion.color
            userCanvas.backgroundColor = UIColor(red: 255, green:255, blue: 255)
            userHexLabel.text = "#FFFFFF"
            goalHexLabel.text = convertToHex(goalCanvas.backgroundColor!)
            createGradientView(goalCanvasQuestion.color)
        } else {
            userCanvas.backgroundColor = UIColor(red: yellowCount * 50, green: redCount * 50, blue: blueCount * 50)
            userHexLabel.text = convertToHex(userCanvas.backgroundColor!)
        }
    }
    
    /**
     Checks if any color button is negative or over 5, and set the lower bound to 0 and upper bound to 5
     */
    func isCounterValueAllowed(button: UIButton, count: inout Int){
        if count < 0{
            count = 0
            button.setTitle(String(count), for: .normal)
        } else if count > 5 {
            count = 5
            button.setTitle(String(count), for: .normal)
        }
    }
    
    /**
     Display the popup view and blur out the background
     */
    func displayPopup(){
        view.addSubview(popupView)
        popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        popupView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        popupView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        
        UIView.animate(withDuration: 0.5){
            self.blurView.alpha = 1
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
        }
    }
    
    /**
     Returns the hex value of a UIColor
     */
    func convertToHex(_ color: UIColor) -> String {
        let components = color.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
    }
    
    func createGradientView(_ userColor: UIColor){
        print("i was called with color ")
        print(userColor)
    
        let colorOne = userColor.cgColor
        let colorTwo = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        gradientSet.append([colorOne, colorTwo])
        gradientSet.append([colorTwo, colorOne])
        
        // Set where the gradient size and bound
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        
        self.view.layer.insertSublayer(gradient, at: 0)
        animateGradient()
    }
    
    /**
     Animtate for 3 seconds, makes sure the animation doesn't get removed upon completion
     */
    func animateGradient(){
        // cycle through the colors
        if currentGradient < gradientSet.count - 1{
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 2.0
        gradientAnimation.toValue = gradientSet[currentGradient]
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.delegate = self
        gradient.add(gradientAnimation, forKey: "gradientChangeAnimation")
    }
    
    /**
     If animation stops, restart it
     */
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
}

extension GameViewController: PopupDelegate {
    /**
     Remove the popup when user clicks the 'correct' button
     */
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blurView.alpha = 0
            self.popupView.alpha = 0
            self.popupView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (Bool) in
            self.popupView.removeFromSuperview()
        }
    }
}
