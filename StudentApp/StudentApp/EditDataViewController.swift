//
//  EditDataViewController.swift
//  StudentApp
//
//  Created by Abhi on 02/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var txtRno : UITextField!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtMarks : UITextField!
    @IBOutlet var txtCity : UITextField!
    
    var stuData : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if stuData != nil {
            txtRno.text = "\((stuData?.rollNo)!)"
            txtName.text = stuData?.name
            txtMarks.text = "\((stuData?.marks)!)"
            txtCity.text = stuData?.city
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClicked(_ sender : UIButton) {
        
        let listVc = self.navigationController?.viewControllers[0] as! ViewController
        
        let stu = Student(rollNo: Int(txtRno.text!)!, name: txtName.text!, marks: Double(txtMarks.text!)!, city: txtCity.text!)
        
        listVc.arrStuData?.append(stu)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == txtRno {
            
            txtName.becomeFirstResponder()
        }
        else if textField == txtName {
            
            txtMarks.becomeFirstResponder()
        }
        else if textField == txtMarks {
            
            txtCity.becomeFirstResponder()
        }
        else if textField == txtCity {
            
            txtCity.resignFirstResponder()
        }
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
