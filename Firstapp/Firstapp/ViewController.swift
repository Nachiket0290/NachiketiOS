//
//  ViewController.swift
//  Firstapp
//
//  Created by Codekul on 13/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UITextField!
    
    
    @IBOutlet weak var view1: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColour(_ sender: Any) {
        
        let x = txt.text
        switch x {
        case "Red"?:
            view1.backgroundColor = UIColor.red
        case "Blue"?:
            view1.backgroundColor = UIColor.blue
        case "Green"?:
            view1.backgroundColor = UIColor.green
        case "Yellow"?:
            view1.backgroundColor = UIColor.yellow
        case "Cyan"?:
            view1.backgroundColor = UIColor.cyan
        default:
            print("Not valid colour")
        }
        
    }

}

