//
//  SignUpTableViewCell.swift
//  APIUsingMVC
//
//  Created by appinventiv on 18/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.


import UIKit
class SignUpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dataTextField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.dataTextField.endEditing(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

