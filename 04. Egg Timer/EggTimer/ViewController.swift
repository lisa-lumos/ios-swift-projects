//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBAction func softEggButton(_ sender: UIButton) {
        // print(sender.currentTitle)
        let hardnessChosen = sender.currentTitle
        if (hardnessChosen == "Soft") {
            print(softTime)
        } else if (hardnessChosen == "Medium") {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        
        // switch hardnessChosen {
        //     case "Soft": print(softTime)
        //     case "Medium": print(mediumTime)
        //     case "Hard": print(hardTime)
        //     default: print("Error")
        // }
        
        // switch number {
        //     case 0..<10: print("[0, 10)")
        //     case 10..<20: print("[10, 20)")
        //     case 20...100: print("[20, 100]")
        //     default: print("Error")
        // }
        
        // // dictionary, retrieve using dict["key1"]
        // var dict1 = ["key1" : "value1", "key2" : "value2"]
        // var dict2 : [String : String]
        // = ["key1" : "value1", "key2" : "value2"]
        // // Array, idx starts at 0, retrieve using arr[0]
        // var arr = [1, 2, 3]
    }
    
}
