//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IB outlets allows for referencing UI elements from code
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   who       what          value
        diceImageView1.image = UIImage (named: "DiceSix")
        // diceImageView1.alpha = 0.5
        diceImageView2.image = UIImage (named: "DiceTwo")
    }
}

