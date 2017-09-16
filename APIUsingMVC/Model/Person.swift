//
//  Person.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation

class Person {
    
    var username: String
    var password: String
    var dob: String
    var contactNo: String
    
    init(username: String, password: String, dob: String, contactNo: String) {
        self.username = username
        self.password = password
        self.dob = dob
        self.contactNo = contactNo
        print("username in Person Class is \(username)")
        print("password in Person Class is \(password)")
        print("dob in Person Class is \(dob)")
        print("contactNo in Person Class is \(contactNo)")
    }
    
    
}
