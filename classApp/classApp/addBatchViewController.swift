//
//  addBatchViewController.swift
//  classApp
//
//  Created by Codekul on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class addBatchViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var lblCouse: UILabel!
    var course = ""
    
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createDatePicker()
        createTimePicker()
        lblCouse.text = course
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func createDatePicker(){
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //add done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateDonePressed))
        toolbar.setItems([doneButton], animated: true)
        
        // change date picker mode
        datePicker.datePickerMode = .date
        
        
        txtDate.inputAccessoryView = toolbar
        txtDate.inputView = datePicker
        
        
    }
    
    func createTimePicker(){
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //add done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(timeDonePressed))
        toolbar.setItems([doneButton], animated: true)
        
        // change date picker mode
        timePicker.datePickerMode = .time
        
        
        txtTime.inputAccessoryView = toolbar
        txtTime.inputView = timePicker
        
        
    }
    
    
    
    
    func dateDonePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        txtDate.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    func timeDonePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        txtTime.text = dateFormatter.string(from: timePicker.date)
        self.view.endEditing(true)
        
    }

    

    /*
    // MARK: - Button events

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func saveClicked(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let batchInfo = NSEntityDescription.insertNewObject(forEntityName: "Batch", into: context) as! Batch
        
        batchInfo.name = txtName.text!
        batchInfo.startDate = txtDate.text!
        batchInfo.time = txtTime.text!
        //batchInfo.course = lblCouse.text!
        batchInfo.course?.name = lblCouse.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    

}
