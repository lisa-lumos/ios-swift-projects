//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Lisa J on 12/3/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    // includes properties and methods required to calculate BMI, interprete the BMI, provide advice and the appropriate color
    
    // Note that when struct is initialized, bmi initial value is unknown
    // if we do not assign a value now and here, we need to pass a value into this struct to initialize it. To do this correctly, need to set bmi as an optional float.
    // var bmi: Float = 0.0
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(red: 105/255, green: 182/255, blue: 245/255, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(red: 108/255, green: 204/255, blue: 124/255, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 204/255, green: 108/255, blue: 161/255, alpha: 1))
        }
        
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
}
