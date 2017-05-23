//
//  ViewController.swift
//  userDefaultDatabase
//
//  Created by Codekul on 11/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let nameData = UserDefaults.standard.value(forKey: "name")
        
        if nameData != nil {
            lblName.text = nameData as! String?
        }
        
        
    }


}

