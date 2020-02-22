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
    
    @IBAction func yellowButton(_ sender: UIButton) {
        print("I was pressed")
    }
    
    @IBAction func yellowButtonCounter(_ sender: UIButton) {
        print("decrease yellow")
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
        userCanvas.backgroundColor = UIColor.red
        QuestionBank.sharedQuestionBank.addQuestions()
        let goalCanvasQuestion:Canvas = QuestionBank.sharedQuestionBank.pop()
        goalCanvas.backgroundColor = goalCanvasQuestion.color
        // Do any additional setup after loading the view.
    }


}
