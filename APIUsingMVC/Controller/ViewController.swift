//
//  ViewController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    
    
    @IBAction func signInBtnTap(_ sender: UIButton) {
        myActivityIndicator.color = UIColor.blue
        myActivityIndicator.startAnimating()
        
        let personInfo = logInWith(userName: userNameTextField.text!, password: passwordTextField.text!, dob: DOBTextField.text!, contactNo: contactNoTextfield.text! )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.myActivityIndicator.stopAnimating()
            
            guard let signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewCotrollerId") as? SecondViewCotroller else {fatalError("unable to make object")}
            
            signUpScene.usernameSecond = personInfo.username
            signUpScene.passwordSecond = personInfo.password
            signUpScene.dobSecond = personInfo.dob
            signUpScene.contactNoSecond = personInfo.contactNo
            
            
            
            self.navigationController?.pushViewController(signUpScene, animated: true)
            print("Button Tap")
            print("username in ViewController is \(personInfo.username)")
            print("password in ViewController is \(personInfo.password)")
            print("dob in ViewController is \(personInfo.dob)")
            print("contactNo in ViewController is \(personInfo.contactNo)")
            
        })}
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var DOBTextField: UITextField!
    
    @IBOutlet weak var contactNoTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator.center = view.center
        myActivityIndicator.isHidden = true
        view.addSubview(myActivityIndicator)
        
        
        
    }
    
    
    
    
}

