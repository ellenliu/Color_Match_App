//
//  WikiView.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-03-30.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import Foundation
import SwiftUI

struct WikiView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("What is Color?").font(.system(size: 30)).bold()
            
            Text("Light is differentially reflected at each wavelength, which gives " +
                "objects their natural color. Color is not a property of light, but rather " +
                "an artifact of human perception. What we call 'color' is how we perceive light's wavelength.")
            
            Image("color-spectrum").resizable().scaledToFit()
            
            Text("How to Play").font(.system(size: 30)).bold()
            
            Text("Most colors can be represented as a positive sum of the three primary colors. " +
                "This is called additive mixing. You will be given a split screen with the goal color on " +
                "one panel, and the objective of the game is to recreate the color on the other panel " +
                "with the correct mixutre of the three primary colors.")
            
            Image("color-mix").resizable().scaledToFit()
        }
            .padding([.leading, .trailing], 30)
    }
}


