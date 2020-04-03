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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("What is Color?").font(.system(size: 30)).bold().padding(.top, 60)
            
                Text("Our perception of color is determined by two factors - the light rays of different wavelengths " + "entering our eyes, and how our brains subjectively interpret those light rays. Therefore, color is " + "not a property of light, but rather an product of human perception. " +
                    "What we call 'color' is how we perceive a very small range of light's wavelength.")
                
                Image("color-spectrum").resizable().scaledToFit()
                
                Text("Additive Mixing").font(.system(size: 30)).bold().padding(.top, 10)
                
                Text("Most colors can be represented as a positive sum of the three primary colors - red, green, and blue. " +
                "This is called additive mixing. This means a lot of colors can be described as: ")
                
                Image("formula").resizable().scaledToFit()
                
                Text("Where A, B, and C are non negative integers. Here is an example: " + "")
                
                Image("example").resizable().scaledToFit()
                
                Text("How to Play").font(.system(size: 30)).bold().padding(.top, 10)
                
                Text("You will be given a split screen with the goal color on " +
                    "one panel, and the objective of the game is to recreate the color on the other panel " +
                    "with the correct mixutre of the three primary colors.")
                
                Image("color-mix").resizable().scaledToFit()
            }
                .padding([.leading, .trailing], 40)
        }
    }
}


