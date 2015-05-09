//
//  PSBaseService.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/9.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import Foundation

class PSBaseService: NSObject {
    let domain = "http://103.249.252.238/"
    
    func requestForJsonRespond (method: Method, path: String, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = .URL, callback: (resultDictionary: NSDictionary?, error: NSError?) -> Void) -> Request {
        
        let URLString = domain + path
        return request(method, URLString, parameters: parameters, encoding: encoding).responseJSON {
            (_, _, JSON, respondError) in
            if let error = respondError {
                callback(resultDictionary: nil, error: error)
                return;
            }
            
            let jsonDictionary = JSON as! NSDictionary
            let code = jsonDictionary["code"] as! Int
            let message = jsonDictionary["msg"] as! String
            if (code != 0) {
                var error = NSError(domain: "com.nightwind.protraitshop.service.error", code: code, userInfo: ["msg" : message])
                callback(resultDictionary: jsonDictionary, error: error)
                return
            }
        }
    }
}

