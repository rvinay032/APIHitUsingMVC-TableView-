//
//  Person.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation

class Person {
    
    var usernamePerson: String
    var passwordPerson: String
    var dobPerson: String
    var contactNoPerson: String
    
    init(jsonData:JSON) {
        
        self.usernamePerson = jsonData["json"]["userName"].stringValue
        self.passwordPerson = jsonData["json"]["password"].stringValue
        self.dobPerson = jsonData["json"]["dob"].stringValue
        self.contactNoPerson = jsonData["json"]["contactNo"].stringValue
        print(" username in Person is \(self.usernamePerson)")
    }
    
}


