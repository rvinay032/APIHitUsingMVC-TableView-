//
//  APIController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation




func logInWith(userName:String,password:String) -> Person {
    
    let signInUrl = "https://httpbin.org/post"
    let ob: Person = getSignIn(username: userName, password: password, url: signInUrl)
    return ob
}

