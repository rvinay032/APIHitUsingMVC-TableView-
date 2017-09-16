//
//  NetworkController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved./Users/appinventiv/Desktop/APIUsingMVC
//

import Foundation


func getSignIn(username: String, password: String, dob: String, contactNo: String, url: String) -> Person{
    let ob = Person(username: username, password: password, dob: dob, contactNo: contactNo)
    let postData = NSMutableData(data: "UserName=\(username)".data(using: String.Encoding.utf8)!)
    postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
    postData.append("&DateOfBirth=\(dob)".data(using: String.Encoding.utf8)!)
    postData.append("&ContactNo=\(contactNo)".data(using: String.Encoding.utf8)!)
    
    let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    
    request.httpMethod = "POST"

    request.httpBody = postData as Data
    
   URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let err = error {
            print(err)
        }
        else {
            
            let json = JSON(data!)
      
           
            Person.init(username: json["form"]["UserName"].string!, password: json["form"]["Password"].string!, dob: json["form"]["DateOfBirth"].string!, contactNo: json["form"]["ContactNo"].string!)
          
           
            
        }
//    let httpResponse = response as! HTTPURLResponse
//    print("My HTTP Response is = = = \(httpResponse)")
   
    
}).resume()
   return ob
}



