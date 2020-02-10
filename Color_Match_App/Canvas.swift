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
 Two canvas are displayed on the game view controller, one displays the goal color, and the other is the result of the
 colors that the user is currently mixing
 */
struct Canvas {
    var color: UIColor
    var components: [Int: UIColor]
}

