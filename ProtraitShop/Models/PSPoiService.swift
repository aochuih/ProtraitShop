//
//  PSPoiService.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSPoiService: NSObject {
    
    func fetchPoiList(userName: String, completionHandler: ([PSPoi], NSError?) -> Void) {
        request(Method.POST, "http://103.249.252.238/api/v1/shopList/", parameters: [:]).responseJSON { (_, _, JSON, respondError) in
            if let error = respondError {
                completionHandler([], error)
                return;
            }
            
            if let errorResult: NSDictionary = (JSON as? NSDictionary) {
                var errorCode = errorResult["code"] as! Int
                var errorMessage = errorResult["message"] as! String
                var error = NSError(domain: "com.nightwind.protraitshop.service.error", code: errorCode, userInfo: ["message" : errorMessage])
                completionHandler([], error)
                return
            }
            
            
            let poiArray: [PSPoi] = (JSON! as! [NSDictionary]).map {
                PSPoi(dictionary: ($0 as NSDictionary))
            }
            completionHandler(poiArray,nil)
        }
    }
    
    func getPoiDetail(userName: String, completionHandler:(poiDetail: PSPoi?, NSError?) -> Void) {
        request(Method.POST, "http://103.249.252.238/api/v1/shopDetail/", parameters: [:]).responseJSON { (_, _, JSON, respondError) in
            if let error = respondError {
                completionHandler(poiDetail:nil, error)
                return;
            }
            
            if let errorResult: NSDictionary = (JSON as? NSDictionary) {
                var errorCode = errorResult["code"] as! Int
                var errorMessage = errorResult["message"] as! String
                var error = NSError(domain: "com.nightwind.protraitshop.service.error", code: errorCode, userInfo: ["message" : errorMessage])
                completionHandler(poiDetail:nil, error)
                return
            }
            
            var poiDetail = PSPoi(dictionary: (JSON! as! NSDictionary))
            completionHandler(poiDetail: poiDetail, nil)
        }
    }
   
}
