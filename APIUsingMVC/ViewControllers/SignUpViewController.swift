//
//  SignUpVCViewController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 18/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//


import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    
    // Variable declartion %%%%%%%%%%%%%%%% ------------------
    
    let arr = ["userName", "password", "dob", "contactNo" ]
    
    var dict = [String: String]()
    
    // outlet for tableView %%%%%%%%%%%%% ------------------
    
    @IBOutlet weak var signUptableView: UITableView!
    
    @IBAction func signUpBtnTap(_ sender: UIButton) {
        
        self.view.endEditing(true)

        // Call loader method-----------!!!!!!!!!!!!!
        
        AppLoader.startLoader()
        
        APIController().logInWith(dictData: dict)  {
            
            objOfPerson in
            
            guard let signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewCotrollerId") as? SecondViewCotroller else {fatalError("unable to make object")}
            
            signUpScene.usernameSecond = objOfPerson.usernamePerson
            signUpScene.passwordSecond = objOfPerson.passwordPerson
            signUpScene.dobSecond = objOfPerson.dobPerson
            signUpScene.contactNoSecond = objOfPerson.contactNoPerson
            print(objOfPerson.usernamePerson)
           
            /// call Stop Loader method--------------
            AppLoader.stopLoader()
            
            self.navigationController?.pushViewController(signUpScene, animated: true)
            
        }}
    
    
    // View methods.............
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let  cellNib = UINib(nibName: "SignUpTableViewCell", bundle: nil)
        signUptableView.register(cellNib, forCellReuseIdentifier: "SignUpTableViewCellId")
        
        signUptableView.delegate = self
        signUptableView.dataSource = self
        
    }
    
    // Class Methods %%%%%%%%%%%%%%
    
    func getCell(_ textField: UITextField) -> UITableViewCell{
        
        var cell : UIView = textField
        while !(cell is SignUpTableViewCell) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? SignUpTableViewCell else {fatalError()}
        return tableCell
    }
    
    // Store data in dictionary from textFields.................!!!!!
    
    
    @objc func textFieldDidChange(textField: UITextField) {
       
        guard let cell = getCell(textField) as? SignUpTableViewCell else {fatalError()}
        
        guard let customindex = self.signUptableView.indexPath(for: cell) else {fatalError()}
        
        dict[arr[customindex.row]] = cell.dataTextField.text!
        
        print("dict data is \(dict)")
        
    }
}

////// Extension of SignUpView Class-----------------

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpTableViewCellId", for: indexPath) as? SignUpTableViewCell else {fatalError("unable to make cell")}
       
        cell.dataTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        cell.dataTextField.delegate = self
        
        cell.dataTextField.placeholder = self.arr[indexPath.row]
        
        if cell.dataTextField.placeholder == "password" {
            cell.dataTextField.isSecureTextEntry = true
            }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    

    
    
}

