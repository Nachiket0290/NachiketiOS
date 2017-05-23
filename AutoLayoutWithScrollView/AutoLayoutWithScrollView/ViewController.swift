//
//  ViewController.swift
//  AutoLayoutWithScrollView
//
//  Created by Codekul on 10/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var innerViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lbl.text = "\(innerViewHeight.constant)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increaseHeight(_ sender: UIButton) {
        innerViewHeight.constant = innerViewHeight.constant + 50
        self.view.layoutIfNeeded()
        lbl.text = "\(innerViewHeight.constant)"
    }

    @IBAction func reduceSize(_ sender: UIButton) {
        
        innerViewHeight.constant = innerViewHeight.constant - 50
        self.view.layoutIfNeeded()
         lbl.text = "\(innerViewHeight.constant)"
    }
}

