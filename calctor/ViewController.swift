//
//  ViewController.swift
//  calctor
//
//  Created by Cex on 16/07/2016.
//  Copyright © 2016 newmediatechies. All rights reserved.
//

import UIKit
import AVFoundation //au

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Plus = "+"
        case Empty = "empty"
    }
    
    var currentOp: Operation = Operation.Empty
    
    @IBOutlet weak var outputLb: UILabel!
    
    var runNum = ""
    var leftVal = ""
    var rightVal = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numberPress(btn: UIButton) {
    print("hi")
        
        runNum += "\(btn.tag)"
        outputLb.text = runNum
    }
    
   

    @IBAction func divpress(sender: AnyObject) {
        processOp(Operation.Divide)
        
    }
    
    @IBAction func plusPress(sender: AnyObject) {
        processOp(Operation.Plus)
    }
    
    
    @IBAction func equalPress(sender: AnyObject) {
        processOp(currentOp)
    }
    
    func processOp(op: Operation) {
        
        if currentOp != Operation.Empty {
            //math
            if runNum != "" {
            rightVal = runNum
            runNum = ""
            
            if currentOp == Operation.Divide {
                result = "\(Double(leftVal)! / Double(rightVal)!)"
            } else if currentOp == Operation.Plus {
                result = "\(Double(leftVal)! + Double(rightVal)!)"
            }
            
            leftVal = result
            outputLb.text = result
            }
            currentOp = op
        } else {
            leftVal = runNum
            runNum = ""         //clear screen
            currentOp = op      // store number
            
        }
        
    }
    
}

