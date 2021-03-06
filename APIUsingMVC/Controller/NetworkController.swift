//
//  NetworkController.swift
//  APIUsingMVC
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved./Users/appinventiv/Desktop/APIUsingMVC
//

import Foundation
import Alamofire

class NetworkController {
    
    func getSignIn(dictData: [String: String],
                   url: String,
                   success: @escaping ((JSON) -> (Void))) {
        
//        let postData = NSMutableData(data: "UserName=\(dictData["userName"] ?? "")".data(using: String.Encoding.utf8)!)
//
//        postData.append("&Password=\(dictData["password"] ?? "")".data(using: String.Encoding.utf8)!)
//
//        postData.append("&DateOfBirth=\(dictData["dob"] ?? "")".data(using: String.Encoding.utf8)!)
//
//        postData.append("&ContactNo=\(dictData["contactNo"] ?? "")".data(using: String.Encoding.utf8)!)
//
//        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//
//        request.httpMethod = "POST"
//
//        request.httpBody = postData as Data
//
//        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if let err = error {
//                print(err)
//            }
//
//            if let data = data {
//
//                DispatchQueue.main.async {
//                    success(JSON(data))
//                     print("data is \(data)")
//
//                }
//            }
//
//        }).resume()
//
        
        Alamofire.request(url,
                          method: .post,
                          parameters: dictData,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON { (response) in

                            if let data = response.result.value {

                                // Data parsed using SwiftyJSON

                                DispatchQueue.main.async {

                                    success(JSON(data))
                                    print("data is \(data)")
                                    }
                                // Completion Closure called when the value is fetched successfully
//                                completion(json)

                            }

                            if let error = response.error{
                                print(error)
                            }

        }

    }
}



