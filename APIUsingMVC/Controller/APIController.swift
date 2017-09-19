//
//  APIController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation


class APIController {
    
    
    func logInWith(dictData: [String:String], success:@escaping (Person) ->(Void)) {
        
        let signInUrl = "https://httpbin.org/post"
        NetworkController().getSignIn(dictData: dictData, url: signInUrl ) { json in
            
            let personOb = Person(jsonData: json)
            success(personOb)
            
        }
        
    }
    
}
