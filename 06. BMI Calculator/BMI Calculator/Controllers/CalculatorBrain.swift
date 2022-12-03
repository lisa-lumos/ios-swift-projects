//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Lisa J on 12/3/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    // includes properties and methods required to calculate BMI, interprete the BMI, provide advice and the appropriate color
    
    // Note that when struct is initialized, bmi initial value is unknown
    // if we do not assign a value now and here, we need to pass a value into this struct to initialize it. To do this correctly, need to set bmi as an optional float.
    // var bmi: Float = 0.0
    var bmi: Float?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / (height * height)
    }
    
    func getBMIValue() -> String {
        // use bmi! - but if it is called when bmi is still nil, app will crash. Details see next section
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi!)
        return bmiTo1DecimalPlace
    }
}
