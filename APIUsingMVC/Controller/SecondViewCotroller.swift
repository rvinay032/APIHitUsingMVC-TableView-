//
//  SecondViewCotroller.swift
//  APIUsingMVC
//
//  Created by appinventiv on 16/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SecondViewCotroller: UIViewController {
    
    var usernameSecond: String!
    var passwordSecond: String!
    var dobSecond: String!
    var contactNoSecond: String!
    var isEmpty = false
    
    @IBOutlet weak var clearBtnOutlet: UIButton!
    
    @IBOutlet weak var subView: UIView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var contactNoLabel: UILabel!
    
    @IBAction func clearBtn(_ sender: Any) {
        if isEmpty == false
        {
            userNameLabel.text = ""
            passwordLabel.text = ""
            dobLabel.text = ""
            contactNoLabel.text = ""
            isEmpty = true
        }
        
        else {
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                
                self.clearBtnOutlet.transform = CGAffineTransform(translationX: 15, y: 0)
                
            }, completion: {(fin )-> Void in
                self.clearBtnOutlet.transform = CGAffineTransform.identity
                
            } )
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userNameLabel.text = usernameSecond
        passwordLabel.text = passwordSecond
        dobLabel.text = dobSecond
        contactNoLabel.text = contactNoSecond
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 1, options: .autoreverse, animations: {

            self.subView.transform = CGAffineTransform(scaleX:0.5, y: 0.5)
            

        }, completion: { (finish )-> Void in
            self.subView.transform = CGAffineTransform.identity

        }  )
    }

 

}
