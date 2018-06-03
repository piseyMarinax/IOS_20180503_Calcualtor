//
//  ViewController.swift
//  Calculator
//
//  Created by Chhaileng Peng on 6/2/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Add target to button
         button0.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button1.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button2.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button3.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button4.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button5.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button6.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button7.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button8.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
         button9.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
        buttonDot.addTarget(self, action: #selector(buttonNumberClick), for: .touchUpInside)
        
    }
    
  
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonDot: UIButton!
    
    
    @IBOutlet weak var lableScreen1: UILabel!
    
    @IBOutlet weak var lableScreen2: UILabel!
    
    
//    var current_value:Double = 0.00
    var numberOnScreen1 = ""
    var numberOnScreen2 = ""
    var operation = ""
    var newCalculate:Bool? = false
    var isCalculate = false
 
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonNumberClick(_ sender:UIButton)
    {
        
        numberOnScreen2 = lableScreen2.text!
        
        if(operation.isEmpty && newCalculate == true)
        {
            self.buttonClear(sender)
            
            numberOnScreen2 = ""
        }
        
        if(numberOnScreen2 == "0" && Int(sender.currentTitle!) == 0)
        {
            print(sender.currentTitle!)
            return
            
        }
        
        if(numberOnScreen2.contains(".") && sender.currentTitle!.contains("."))
        {
            return
        }
        
        if(numberOnScreen2 == "0" && sender.currentTitle!.contains("."))
        {
            numberOnScreen2 = "0."
            lableScreen2.text =  numberOnScreen2
            return
            
        }
        if(numberOnScreen2 == "0")
        {
            numberOnScreen2 = ""
            
        }
    
        numberOnScreen2.append(sender.currentTitle!)
        lableScreen2.text = numberOnScreen2
        newCalculate = false;
        print(sender.currentTitle!);
        
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        operation = ""
        lableScreen1.text = ""
        numberOnScreen1 = ""
        lableScreen2.text = "0"
        numberOnScreen1 = ""
    }
    
    @IBAction func buttonNagative(_ sender: UIButton) {
    }
    
    @IBAction func buttonRemainder(_ sender: UIButton) {
        numberOnScreen1 = lableScreen2.text!
        operation = "%"
        lableScreen1.text = numberOnScreen1 + operation
        
       
        lableScreen2.text = "0"
        numberOnScreen2 = ""
    }
    
    @IBAction func buttonDevide(_ sender: UIButton) {
        if(!operation.isEmpty)
        {
            return
        }
        numberOnScreen1 = lableScreen2.text!
        operation = "/"
        lableScreen1.text = numberOnScreen1 + operation
        
        lableScreen2.text = "0"
        numberOnScreen2 = ""
    }
    
    @IBAction func buttonTime(_ sender: UIButton) {
        if(!operation.isEmpty)
        {
            return
        }
        numberOnScreen1 = lableScreen2.text!
        operation = "*"
        lableScreen1.text = numberOnScreen1 + operation
        
        lableScreen2.text = "0"
        numberOnScreen2 = ""
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        if(!operation.isEmpty)
        {
            return
        }
        numberOnScreen1 = lableScreen2.text!
        operation = "-"
        lableScreen1.text = numberOnScreen1 + operation
        
        lableScreen2.text = "0"
        numberOnScreen2 = ""
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        if(!operation.isEmpty)
        {
            return
        }
        numberOnScreen1 = lableScreen2.text!
        operation = "+"
        lableScreen1.text = numberOnScreen1 + operation
        
        lableScreen2.text = "0"
        numberOnScreen2 = ""
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        if(operation.isEmpty)
        {
            return
        }
        
        numberOnScreen2 = lableScreen2.text!
        
        var result:Double
        switch operation {
        case "+":
            result = Double(numberOnScreen1)! + Double(numberOnScreen2)!
        case "-":
            result = Double(numberOnScreen1)! - Double(numberOnScreen2)!
        case "/":
            result = Double(numberOnScreen1)! / Double(numberOnScreen2)!
        case "*":
            result = Double(numberOnScreen1)! * Double(numberOnScreen2)!
        case "%":
             result =  Double(numberOnScreen1)!.truncatingRemainder(dividingBy: Double(numberOnScreen2)!)
        default:
            return
        }
        
        
        lableScreen1.text = "\(lableScreen1.text!) \(numberOnScreen2)"
        lableScreen2.text = String(result)
        operation = ""
        newCalculate = true;
        
        
//        if(operation == "+")
//        {
//            numberOnScreen2 = lableScreen2.text!
//
//             print(numberOnScreen1);
//            print(numberOnScreen2);
//
//            lableScreen1.text = "\(lableScreen1.text!) \(numberOnScreen2)"
//            var result:Double = Double(numberOnScreen1)! + Double(numberOnScreen2)!
//           lableScreen2.text = String(result)
//
//            operation = ""
//            newCalculate = true;
//        }
        
//        if(operation == "-")
//        {
//            numberOnScreen2 = lableScreen2.text!
//
//            print(numberOnScreen1);
//            print(numberOnScreen2);
//
//            lableScreen1.text = "\(lableScreen1.text!) \(numberOnScreen2)"
//            var result:Double = Double(numberOnScreen1)! - Double(numberOnScreen2)!
//            lableScreen2.text = String(result)
//
//            operation = ""
//            newCalculate = true;
//        }
        
        
    }
    

}

