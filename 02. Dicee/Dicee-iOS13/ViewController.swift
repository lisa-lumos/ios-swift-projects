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
    let diceArray = [UIImage (named: "DiceOne"),
                     UIImage (named: "DiceTwo"),
                     UIImage (named: "DiceThree"),
                     UIImage (named: "DiceFour"),
                     UIImage (named: "DiceFive"),
                     UIImage (named: "DiceSix")];
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //   who       what          value
//        // diceImageView1.image = UIImage (named: "DiceSix")
//        // diceImageView1.alpha = 0.5
//        /// diceImageView2.image = UIImage (named: "DiceTwo")
//    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // print("Button got tapped. ")
         diceImageView1.image = diceArray[Int.random(in: 0...5)]
         diceImageView2.image = diceArray[Int.random(in: 0...5)]
        // diceImageView1.image = diceArray.randomElement() as! UIImage
        // diceImageView2.image = diceArray.randomElement() as! UIImage
    }
    
    
}

