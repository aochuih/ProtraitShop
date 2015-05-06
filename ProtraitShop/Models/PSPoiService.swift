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
            
            let jsonDictionary = JSON as! NSDictionary
            let code = jsonDictionary["code"] as! Int
            let message = jsonDictionary["message"] as! String
            if (code != 0) {
                var error = NSError(domain: "com.nightwind.protraitshop.service.error", code: code, userInfo: ["message" : message])
                completionHandler([], error)
                return
            }
            
            
            let poiArray: [PSPoi] = (JSON! as! [NSDictionary]).map {
                PSPoi(dictionary: ($0 as NSDictionary))
            }
            completionHandler(poiArray,nil)
        }
    }
    
    func getPoiDetail(userID: String, poiID: String, completionHandler:(poiDetail: PSPoi?, NSError?) -> Void) {
        request(Method.POST, "http://103.249.252.238/api/v1/shopDetail/", parameters: [ "userId": userID, "id": poiID]).responseJSON { (_, _, JSON, respondError) in
            if let error = respondError {
                completionHandler(poiDetail:nil, error)
                return;
            }
            
            let jsonDictionary = JSON as! NSDictionary
            let code = jsonDictionary["code"] as! Int
            let message = jsonDictionary["message"] as! String
            if (code != 0) {
                var error = NSError(domain: "com.nightwind.protraitshop.service.error", code: code, userInfo: ["message" : message])
                completionHandler(poiDetail:nil, error)
                return
            }
            
            var poiDetail = PSPoi(dictionary: (JSON! as! NSDictionary))
            completionHandler(poiDetail: poiDetail, nil)
        }
    }
   
}
