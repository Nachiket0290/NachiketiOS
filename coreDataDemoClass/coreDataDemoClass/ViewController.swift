//
//  ViewController.swift
//  coreDataDemoClass
//
//  Created by Codekul on 19/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtRollNo: UITextField!
    
    @IBOutlet weak var txtMarks: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button Clicked
    @IBAction func saveClicked(_ sender: UIButton) {
        saveData()
    }
    @IBAction func showClicked(_ sender: UIButton) {
        showData()
    }
    @IBAction func searchClicked(_ sender: UIButton) {
        searchData()
    }
    @IBAction func updateClicked(_ sender: UIButton) {
        updateData()
    }
    @IBAction func deleteClicked(_ sender: UIButton) {
        deleteData()
    }
  
    // Functions
    func saveData() {
        
        let fetchData = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
        
        fetchData.setValue((txtName.text!), forKey: "name")
        fetchData.setValue(Int32(txtRollNo.text!), forKey: "rno")
        fetchData.setValue(Int32(txtMarks.text!), forKey: "marks")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("Enter Data Succesfully")
        clearFields()
    }
    func showData() {
        
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do {
            let stud_info = try context.fetch(fetchData) as! [Student]
            
            for stu in stud_info {
                print("Name = \(stu.name!) \nRoll NO: \(stu.rno) \nMarks: \(stu.marks)")
            }
            clearFields()
            
        } catch {
            fatalError("Failed to fetch data \(error)")
        }
        
    }
    func searchData() {
        
        let x = Int32(txtRollNo.text!)
        
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchData.predicate = NSPredicate(format: "rno == %d", x!)
        
        do {
            let stud_info = try context.fetch(fetchData) as! [Student]
            
            for stu in stud_info {
                print("Name = \(stu.name!) \nRoll NO: \(stu.rno) \nMarks: \(stu.marks)")
            }
            clearFields()
        } catch {
            fatalError("Failed to fetch data \(error)")
        }

        
    }
    func updateData() {
        let x = Int32(txtRollNo.text!)
        
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        fetchData.predicate = NSPredicate(format: "rno = %i", x!)
        
        do {
            let stud_info = try context.fetch(fetchData) as! [Student]
            
                        
            stud_info[0].setValue((txtName.text!), forKey: "name")
            stud_info[0].setValue(Int32(txtRollNo.text!), forKey: "rno")
            stud_info[0].setValue(Int32(txtMarks.text!), forKey: "marks")
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print("Successfully Updated")
            clearFields()
            
        } catch {
            fatalError("Failed to fetch data \(error)")
        }
        
    }
    func deleteData() {
        let x = Int32(txtRollNo.text!)
        
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        fetchData.predicate = NSPredicate(format: "rno = %i", x!)
        
        do {
            let stud_info = try context.fetch(fetchData) as! [Student]
            
            context.delete(stud_info[0])
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print("Successfully Deleted")
            clearFields()
            
        } catch {
            fatalError("Failed to fetch data \(error)")
        }
        
        
    }


    // clear fields
    func clearFields(){
        txtMarks.text = ""
        txtRollNo.text = ""
        txtName.text = ""
    }
    
}

