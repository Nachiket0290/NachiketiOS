//
//  batchTableViewCell.swift
//  classApp
//
//  Created by Codekul on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class batchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
