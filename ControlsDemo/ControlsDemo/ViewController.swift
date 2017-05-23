//
//  ViewController.swift
//  ControlsDemo
//
//  Created by Codekul on 14/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //views
    
    
    @IBOutlet weak var sliderView: UIView!
    
    @IBOutlet weak var datePickerView: UIView!
    
    
    //segments
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //labels
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        lbl.text = ("\(sender.value)")
        
    }

    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sliderView.isHidden = false
            datePickerView.isHidden = true
        case 1:
            sliderView.isHidden = true
            datePickerView.isHidden = false
        default:
            sliderView.isHidden = true
            datePickerView.isHidden = false
        }
        
    }
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        let date = sender.date
        
        let df = DateFormatter()
        
        df.dateFormat = "dd/MM/YYYY HH:mm:ss"
        
        lblDate.text = (df.string(from: date))
        
        
    }
}

