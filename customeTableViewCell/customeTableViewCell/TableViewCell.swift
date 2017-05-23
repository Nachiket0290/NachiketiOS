//
//  TableViewCell.swift
//  customeTableViewCell
//
//  Created by Codekul on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblMarks: UILabel!
    
    @IBOutlet weak var lblNo: UILabel!
     
    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var btnGrade: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
