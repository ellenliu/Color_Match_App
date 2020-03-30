//
//  ViewController.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-06.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, CAAnimationDelegate {
    
    let gradient = CAGradientLayer()
    
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    let colorOne = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
    
    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "GameViewControllerSegue", sender: self)
    }
    
    @IBAction func infoButton(_ sender: Any) {
        present(UIHostingController(rootView: WikiView()), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        createGradientView()
    }
    
    func createGradientView(){
        // Overlap the colors
        gradientSet.append([colorOne, colorTwo])
        gradientSet.append([colorTwo, colorThree])
        gradientSet.append([colorThree, colorOne])
        
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
        gradientAnimation.duration = 3.0
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

