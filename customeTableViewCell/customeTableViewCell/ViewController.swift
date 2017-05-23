//
//  ViewController.swift
//  customeTableViewCell
//
//  Created by Codekul on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrStud : Array<student>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let s1 = student(name: "ABC", marks: 80, no: 1, grade:"A", pic: "ABC.jpg")
        let s2 = student(name: "BCD", marks: 40, no: 2, grade: "D", pic: "BCD.jpg")
        let s3 = student(name: "CDE", marks: 70, no: 3, grade: "B", pic: "CDE.jpg")
        
        arrStud = [s1, s2, s3]
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrStud?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as! TableViewCell?
        
        if cell == nil {
            
            cell = TableViewCell(style: .default, reuseIdentifier: "studentCell")
        }
        
        let x = arrStud?[indexPath.row]
        
        cell?.lblName.text = x?.name
        cell?.lblNo.text = "\((x?.no)!)"
        cell?.lblMarks.text = "\((x?.marks)!)"
        cell?.imgPic.image = UIImage.init(named: (x?.pic)!)
        
        cell?.btnGrade.addTarget(self, action: #selector(btnClicked(_ : )), for: .touchUpInside)
        cell?.btnGrade.tag = indexPath.row
        
        
        return cell!
    }
    
    func btnClicked(_ sender : UIButton) {
        let x = arrStud?[sender.tag]
        print("\((x?.grade)!)")
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

