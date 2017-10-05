//
//  SignUpVCViewController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 18/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//


import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
//    struct UserData {
//
//        var userName : String = ""
//        var password : String = ""
//        var dob : String = ""
//        var contactNo : String = ""
//
//    }
    
    
    @IBOutlet weak var btnOutlet: UIButton!
    
    // Variable declartion %%%%%%%%%%%%%%%% ------------------
    
    let arr = ["userName", "password", "dob", "contactNo" ]
    
    var dict = [String:String]()
    
    var dictToForward = [String: String]()
    
    // outlet for tableView %%%%%%%%%%%%% ------------------
    
    @IBOutlet weak var signUptableView: UITableView!
    
    @IBAction func signUpBtnTap(_ sender: UIButton) {
        
        // Call loader method-----------!!!!!!!!!!!!!
        if arr.count != dict.count {
            print("Array count is \(arr.count)")
            
        }
            
        else if arr.count == dict.count {
            
        AppLoader.startLoader()
        
        APIController().logInWith(dictData: dict)  {
            
            (objOfPerson) in
            
            
            guard let signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "DataShowVCId") as? DataShowVC else {fatalError("unable to make object")}
            
            self.dictToForward["userName"] = objOfPerson.usernamePerson
            
            self.dictToForward["password"] = objOfPerson.passwordPerson
            
            self.dictToForward["dob"] = objOfPerson.dobPerson
            
            self.dictToForward["contactNo"] = objOfPerson.contactNoPerson
            
            signUpScene.dictShow = self.dictToForward
            
            signUpScene.keys = self.arr
            
            //print("dict to show is \(signUpScene.dictShow)")
            //
            //            signUpScene.usernameSecond = objOfPerson.usernamePerson
            //            signUpScene.passwordSecond = objOfPerson.passwordPerson
            //            signUpScene.dobSecond = objOfPerson.dobPerson
            //            signUpScene.contactNoSecond = objOfPerson.contactNoPerson
            //            print(objOfPerson.usernamePerson)
            
            /// call Stop Loader method--------------
            AppLoader.stopLoader()
            
            self.navigationController?.pushViewController(signUpScene, animated: true)
        }
        }
    }
    
    
    // View methods.............
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  cellNib = UINib(nibName: "SignUpTableViewCell", bundle: nil)
        signUptableView.register(cellNib, forCellReuseIdentifier: "SignUpTableViewCellId")
        
        signUptableView.delegate = self
        signUptableView.dataSource = self
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let cell = getCell(textField) as? SignUpTableViewCell else {fatalError()}
        
       // guard let customindex = self.signUptableView.indexPath(for: cell) else {fatalError()}
        
        if cell.dataTextField.placeholder == "contactNo" {
        let maxLength = 10
        let currentString: NSString = cell.dataTextField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    return true
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
        
        //print("dict data is \(dict)")
        
    }
    
  

    
    
    @objc func textFieldDidEnd(textField:UITextField) {
        
        guard let cell = getCell(textField) as? SignUpTableViewCell else {fatalError()}
        
        guard let customindex = self.signUptableView.indexPath(for: cell) else {fatalError()}
        
        if (cell.dataTextField.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Alert", message: "\(arr[customindex.row] + "  can't be empty")", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

    }
    
}

////// Extension of SignUpView Class -----------------

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpTableViewCellId", for: indexPath) as? SignUpTableViewCell else {fatalError("unable to make cell")}
        
        cell.dataTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        cell.dataTextField.addTarget(self, action: #selector(textFieldDidEnd(textField:)), for: .editingDidEnd)
        
        cell.dataTextField.delegate = self
        
        cell.dataTextField.placeholder = self.arr[indexPath.row]
        
        if cell.dataTextField.placeholder == "password" {
            
        cell.dataTextField.isSecureTextEntry = true
       
        }
        
        else if cell.dataTextField.placeholder == "contactNo" {
            
            cell.dataTextField.keyboardType = .numbersAndPunctuation
            
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
 
}

