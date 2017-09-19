//
//  AppLoader.swift
//  APIUsingMVC
//
//  Created by appinventiv on 19/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import SVProgressHUD

class AppLoader {
    
    static func startLoader() {
    
        SVProgressHUD.setDefaultAnimationType(.flat)
        SVProgressHUD.setBackgroundColor(.black)
        SVProgressHUD.setForegroundColor(.red)
        SVProgressHUD.show(withStatus: "Please wait")
    }
    
    static func stopLoader() {
        
         SVProgressHUD.dismiss()
        
        
    }
    
}
