//
//  Canvas.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-09.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import UIKit

/**
 Making UIColor easier to use by always setting alpha to 1 and converting CGFloat to decimals
 */
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

/**
 Two canvas are displayed on the game view controller, one displays the goal color, and the other is the result of the
 colors that the user is currently mixing
 Canvas is a color made up of RGB values. For simplicity, they can only be incremented in units of 50. So a Canvas of (1, 3, 3)
 actually is (R: 50, G: 150, B: 150)
 */
struct Canvas {
    var color: UIColor
    var red: Int
    var green: Int
    var blue: Int
}

/**
 Keeps track of how many times user is pressing each button
 */
struct userCanvas {
    var red: Int
    var green: Int
    var blue: Int
}

