//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Yun Ni on 2024-05-09.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculateBrain{
    
    var bmi: BMI?
    
    mutating func calculatedBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        //        bmi = BMI(value: bmiValue, advice: String, color: T##UIColor)
        if(bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String{
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1Decimal
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
