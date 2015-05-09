//
//  PSPoiService.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSPoiService: PSBaseService {
    
    func fetchPoiList(userName: String, completionHandler: ([PSPoi], NSError?) -> Void) {
        requestForJsonRespond(Method.POST, path: "api/v1/shopList/", parameters: [:]) {
            (resultDictionary, respondError) in
            
            if (respondError != nil) {
                completionHandler([], respondError)
            }
            
            let poiArray: [PSPoi] = (resultDictionary!["data"] as! [NSDictionary]).map {
                PSPoi(dictionary: ($0 as NSDictionary))
            }
            completionHandler(poiArray,nil)
        }
    }
    
    func getPoiDetail(userID: String, poiID: String, completionHandler:(poiDetail: PSPoi?, NSError?) -> Void) {
        requestForJsonRespond(Method.POST, path: "api/v1/shopDetail/", parameters: [ "userId": userID, "id": poiID]) {
            (resultDictionary, respondError) in
            
            if (respondError != nil) {
                completionHandler(poiDetail: nil, respondError)
            }
            
            var poiDetail = PSPoi(dictionary: resultDictionary!)
            completionHandler(poiDetail: poiDetail, nil)
        }
    }
   
}
