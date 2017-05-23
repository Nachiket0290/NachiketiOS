//
//  ViewController.swift
//  controlsByCode
//
//  Created by Codekul on 17/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblm: UILabel!
    
    
    override func viewDidLoad() {
        
        
        let button = UIButton(frame: CGRect(x: 10, y: 70, width: 300, height: 40))
        button.setTitle("Click", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)

        let lbl = UILabel(frame: CGRect(x: 10, y: 30, width: 300, height: 30))
        lbl.text = "Hello"
        lbl.textAlignment = .center
        self.view.addSubview(lbl)
       
        let datePicker = UIDatePicker(frame: CGRect(x:10, y:200, width:300, height: 300))
        datePicker.backgroundColor = UIColor.blue
        datePicker.datePickerMode = .countDownTimer
        
        

        self.view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(datePickedValueChanged(sender:)), for: .valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClicked() {
        
        
    }

    func datePickedValueChanged (sender: UIDatePicker) {
        let date = sender.date
        
        let df = DateFormatter()
        
        df.dateFormat = "mm"
        
        lblm.text = (df.string(from: date))
        count = Int(df.string(from: date))! * 60
        
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        
    }
    func update() {
        
        if(count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            lblTime.text = minutes + ":" + seconds
            count-=1
        }

    }
}

