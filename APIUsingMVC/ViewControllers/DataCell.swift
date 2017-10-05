//
//  DataCell.swift
//  APIUsingMVC
//
//  Created by appinventiv on 19/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    
    
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
