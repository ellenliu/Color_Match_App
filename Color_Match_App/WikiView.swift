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
        VStack(spacing: 10) {
            Text("Hello ") + Text("World!").bold()
        }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.leading, .trailing], 40)
    }
}


