//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {


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
        let value = weight / pow(height, 2)
        print("BMI = \(value)" )
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format:"%.1f" ,value)
        self.present(secondVC, animated: true, completion: nil)
    }
}

