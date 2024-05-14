//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var calculatedBrain = CalculateBrain()

    var bmi_Value = "0.0"

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightPressed(_ sender: UISlider) {
        let currentHighet = String(format: "%.2f", sender.value)
        heightLabel.text = ("\(currentHighet)m")
        
    }
    
    @IBAction func weightPressed(_ sender: UISlider) {
        let currentWeight = String(format: "%0.1f", sender.value)
        weightLabel.text = ("\(currentWeight)Kg")
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = HeightSlider.value
        let weight = weightSlider.value
        
        calculatedBrain.calculatedBMI(height: height, weight: weight)
//        let value = weight / pow(height, 2)
//        bmi_Value = String(format: "%.1f", value)
//        print("BMI = \(value)" )
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let desinationVC = segue.destination as! ResultViewController // forced dowcast
            desinationVC.bmiValue = calculatedBrain.getBMIValue()
            desinationVC.advice = calculatedBrain.getAdvice()
            desinationVC.color = calculatedBrain.getColor()
        }
       
    }
}

