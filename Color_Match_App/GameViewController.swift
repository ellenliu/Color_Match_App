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
    
    @IBAction func backToMenuButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userCanvas.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }


}
