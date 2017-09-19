//
//  NetworkController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved./Users/appinventiv/Desktop/APIUsingMVC
//

import Foundation

class NetworkController {
    
    func getSignIn(dictData: [String: String],
                   url: String,
                   success: @escaping ((JSON) -> (Void))) {
        
        let postData = NSMutableData(data: "UserName=\(dictData["userName"] ?? ""))".data(using: String.Encoding.utf8)!)
        
        postData.append("&Password=\(dictData["password"] ?? ""))".data(using: String.Encoding.utf8)!)
        
        postData.append("&DateOfBirth=\(dictData["dob"] ?? ""))".data(using: String.Encoding.utf8)!)
        
        postData.append("&ContactNo=\(dictData["contactNo"] ?? ""))".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        
        request.httpBody = postData as Data
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error {
                print(err)
            }
            
            if let data = data {
                
                DispatchQueue.main.async {
                    success(JSON(data))
                    
                }
            }
            
            
        }).resume()
        
        
    }
}



