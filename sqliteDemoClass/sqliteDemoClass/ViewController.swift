//
//  ViewController.swift
//  sqliteDemoClass
//
//  Created by Codekul on 17/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtRollNo: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    
    
    var db : OpaquePointer? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openDB()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func saveClicked(_ sender: UIButton) {
        saveData()
    }
    
    
    @IBAction func showClicked(_ sender: UIButton) {
        getData()
    }
    
    
    @IBAction func searchClicked(_ sender: UIButton) {
        searchData()
        
    }
    
    func openDB(){
        let filemanager = FileManager.default
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let destinationPath = documentDirectoryPath.appending("/stud.db")
        
        print(destinationPath)
        
        if !filemanager.fileExists(atPath: destinationPath){
            let sourcePath = Bundle.main.path(forResource: "stud", ofType: "db")
            
            try! filemanager.copyItem(atPath: sourcePath!, toPath: destinationPath)
        }
        
        if sqlite3_open(destinationPath, &db) != SQLITE_OK{
            print("Error in opening database")
        }
    }
    
        
        func saveData(){
            let query = "INSERT INTO StudentInfo VALUES ('\(txtName.text!)', '\(txtRollNo.text!)','\(txtMarks.text!)')"
            
            if sqlite3_exec(db, query, nil, nil, nil) != SQLITE_OK {
                let errMsg = String(cString: sqlite3_errmsg(db!))
                print("error in creating table : \(errMsg)")
            }
            else{
                print("Data saved ")
                textClearTextFeild()
            }
            
        }
        
        
        func getData(){
            var statement : OpaquePointer? = nil
             let query = "SELECT * FROM StudentInfo "
            
            if sqlite3_prepare_v2(db, query, -1, &statement, nil)  != SQLITE_OK{
                let errMsg = String(cString: sqlite3_errmsg(db!))
                print("error in retriving data : \(errMsg)")
            }
            
            while sqlite3_step(statement) == SQLITE_ROW {
                let rno = sqlite3_column_text(statement, 1)
                let rnoString = String(cString: rno!)
                print("Rno = \(rnoString)")
                
                if let name = sqlite3_column_text(statement, 0) {
                    let nameString = String(cString: name)
                    print("name = \(nameString)")
                } else {
                    print("name not found")
                }
                
                if let marks = sqlite3_column_text(statement, 2) {
                    let marksString = String(cString: marks)
                    print("marks = \(marksString)")
                } else {
                    print("marks not found")
                }
            
        }
        
    }
    
    func searchData(){
        var statement : OpaquePointer? = nil
        let x = txtRollNo.text
        let query = "SELECT * FROM StudentInfo WHERE RollNo =\(x!) "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil)  != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db!))
            print("error in searching data : \(errMsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let rno = sqlite3_column_text(statement, 1)
            let rnoString = String(cString: rno!)
            //print("Rno = \(rnoString)")
            txtRollNo.text = rnoString
            
            if let name = sqlite3_column_text(statement, 0) {
                let nameString = String(cString: name)
                //print("name = \(nameString)")
                txtName.text = nameString
            } else {
                print("name not found")
            }
            
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
                print("marks = \(marksString)")
                txtMarks.text = marksString
            } else {
                print("marks not found")
            }
            
        }
        
        
    }
    
    /*
     AGtkyGGC
 
 */
    
    func updateData(){
        var statement : OpaquePointer? = nil
        let x = txtRollNo.text
        let query = "UPDATE StudentInfo SET Name = '\(txtName.text!)', Marks= '\(txtMarks.text!)' WHERE RollNo =\(x!) "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil)  != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db!))
            print("error in updating data : \(errMsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let rno = sqlite3_column_text(statement, 1)
            let rnoString = String(cString: rno!)
            //print("Rno = \(rnoString)")
            txtRollNo.text = rnoString
            
            if let name = sqlite3_column_text(statement, 0) {
                let nameString = String(cString: name)
                //print("name = \(nameString)")
                txtName.text = nameString
            } else {
                print("name not found")
            }
            
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
                print("marks = \(marksString)")
                txtMarks.text = marksString
            } else {
                print("marks not found")
            }
            
        }
        
        
    }
    
    
    /* DELETE FROM COMPANY WHERE ID = 7 */
    
    
    func deleteData(){
        //var statement : OpaquePointer? = nil
        let x = txtRollNo.text
        let query = "DELETE FROM StudentInfo WHERE RollNo = \(x!)"
        
        if sqlite3_exec(db, query,nil, nil,nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db!))
            print("error in deleting data : \(errMsg)")
        }
        
    }
    
    
    
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        deleteData()
    }
    
    
    

    
    @IBAction func updateClicked(_ sender: Any) {
        updateData()

    }
 
    
    
    
    func textClearTextFeild() {
        txtRollNo.text = ""
        txtName.text = ""
        txtMarks.text = ""
    }
    

}

