//
//  ViewController.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-02-06.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "GameViewControllerSegue", sender: self)
    }
    
    @IBAction func infoButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

   
    
}

