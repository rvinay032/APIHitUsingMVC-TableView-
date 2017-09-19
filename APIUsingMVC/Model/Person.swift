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
        
        self.usernamePerson = jsonData["form"]["UserName"].stringValue
        self.passwordPerson = jsonData["form"]["Password"].stringValue
        self.dobPerson = jsonData["form"]["DateOfBirth"].stringValue
        self.contactNoPerson = jsonData["form"]["ContactNo"].stringValue
        print(" username in Person is \(self.usernamePerson)")
    }
    
    }


