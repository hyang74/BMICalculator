//
//  ViewController.swift
//  BMIcounter
//
//  Created by YangHuairuo on 2016-01-24.
//  Copyright © 2016 Yangisee. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var barr: UILabel!

    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var genderSelect: UISegmentedControl!
    @IBOutlet weak var high: UILabel!
    
    @IBOutlet weak var suggestion: UISwitch!
    var a:Int = 1
    @IBAction func gencerChoose(sender: AnyObject) {
        
        if(genderSelect.selectedSegmentIndex == 0)
        {
            gender.text = "Not selected";
            a = 1
        }
        if(genderSelect.selectedSegmentIndex == 1)
        {
            gender.text = "Female";
            a = 2
        }
        if(genderSelect.selectedSegmentIndex == 2)
        {
            gender.text = "Male";
            a = 3
        }


    }
   
    
    var highh:Int = 130
    @IBOutlet weak var heightValue: UISlider!
    @IBOutlet weak var heightNum: UILabel!
    @IBAction func height(sender: UISlider) {
        highh = Int(sender.value)
        heightNum.text = "\(highh)"
    }
    @IBOutlet weak var stepper: UIStepper!
    
    var agee:Int = 20
    @IBAction func stepperValue(sender: UIStepper) {
         age.text = Int(sender.value).description
        agee = Int(stepper.value)
    }
    
    @IBOutlet weak var suggest: UILabel!
    
    
    var w:Double = 1.0
  
    @IBAction func weightInput(sender: UITextField) {
        if (weight.text != nil)
        {
        w = Double(weight.text!)!
        }
        else
        {w = 1.0}
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    var s: Int = 0
    var emptys:String = " "
    var somes: String = " "
    var counter: Int = 0
    @IBAction func suggestS(sender: UISwitch) {
        if suggestion.on
        {
            s = 1
            suggest.text = somes
            if (counter == 1)
            {
                barr.text = " "
            }
            else
            {
                if (counter == 0)
                    {
                        barr.text="The most elegant and beautiful\n BMI calculater ever!"
                    }
                else
                {
                    if (counter == 2)
                    {
                        barr.text="BMI is related to personal health.\n The best BMI is between 18.5～23.9"
                    }
                else
                    {
                        if (counter == 4)
                        {
                            barr.text = "If you would like to give details above,\n this app can help you to impove your health"
                            suggest.text = " "
                        }
                        else
                        {
                            barr.text = "Gender is not selected"
                            suggest.text = " "
                        }
                    }
                }
            }

        }
        else
        {
            s = 0
            suggest.text = emptys
            if (counter == 1)
            {
                barr.text = "Enable switch to see suggetions"
            }
            else
                if (counter == 0)
                {
                    barr.text = "The most elegant and beautiful\n BMI calculater ever!"
                }
                else
                {
                    if (counter == 2)
                {
                    barr.text="BMI is related to personal health.\n The best BMI is between 18.5～23.9"
                }
                else
                {
                    if (counter == 4)
                    {
                        barr.text = "If you would like to give details above,\n this app can help you to impove your health"
                        suggest.text = " "
                    }
                    else
                    {
                        barr.text = "Gender is not selected"
                        suggest.text = " "
                    }
                }
            }
            
        }
        }
    
    
    var bminum:Double = 0.0
    @IBAction func calculate(sender: AnyObject) {
        if (a != 1)
        {
        counter = 1
        bminum = round(100*(10000*w/Double(highh*highh))/100)
        if (bminum > 5.0 && bminum < 80.0 )
        {
                if (s==1)
                {
                    bmi.text = "\(bminum)"
                    somes = "Suggestions will be implemented in later versions"
                        suggest.text = somes
                        barr.text = " "
                }
                else
                {
                    bmi.text = "\(bminum)"
                    suggest.text = " "
                    somes = "Suggestions will be implemented in later versions"
                    barr.text = "Enable switch to see suggetions"
                    
                }
        }
        else
        {
            bmi.text = "Wrong Statics!"
            barr.text = "If you would like to give details above,\n this app can help you to impove your health"
            counter = 4
        }
        }
        else
        {
            counter = 3
            barr.text = "Gender is not selected"
            suggest.text = " "
        }
    }
    
    @IBOutlet weak var resetB: UIButton!
    
    @IBAction func resetPressed(sender: AnyObject) {
        gender.text = "Not selected"
        genderSelect.selectedSegmentIndex=0
        age.text = "20"
        stepper.value=20
        high.text = "Not set"
        heightValue.value = 130
        weight.text=" "
        bmi.text = "0.0"
        bminum = 0.0
        w=0.0
        highh=130
        a=1
        agee = 20
        s=0
        barr.text = "BMI is related to personal health.\n The best BMI is between 18.5～23.9"
        suggestion.setOn(false,animated: true)
        suggest.text = " "
        somes = " "
        counter = 2
    }
    
    override func viewDidLoad() {
        gender.text = "Not selected"
        age.text = "20"
        bmi.text = "0.0"
        high.text = "Not set"
        barr.text = "The most elegant and beautiful\n BMI calculater ever!"
        stepper.value=20
        suggest.text = " "
        counter = 0
        a=1
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

