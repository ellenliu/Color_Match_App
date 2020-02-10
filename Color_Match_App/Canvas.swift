//
//  Canvas.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-09.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import UIKit

// Making UIColor easier to use by always setting alpha to 1 and converting CGFloat
// decimals
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
 */
struct Canvas {
    var color: UIColor
    var components: [Int: UIColor]
}

