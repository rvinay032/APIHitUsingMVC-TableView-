//
//  ViewController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
 
    @IBAction func signInBtnTap(_ sender: UIButton) {
       
    let personInfo = logInWith(userName: userNameTextField.text!, password: passwordTextField.text!)
        print("Button Tap")
        print(personInfo.username)
        print(personInfo.password)
        
    }
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

