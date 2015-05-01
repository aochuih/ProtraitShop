//
//  PSPoiService.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSPoiService: NSObject {
    
    internal func fetchPoiList(userName: String, completionHandler: ([PSPoi], NSError?) -> Void) {
        request(Method.POST, "http://103.249.252.238/api/v1/shopList/", parameters: [:]).responseJSON { (_, _, JSON, _) in
            let poiArray: [PSPoi] = (JSON! as! [NSDictionary]).map {
                PSPoi(dictionary: ($0 as NSDictionary))
            }
            completionHandler(poiArray,nil)
        }
    }
   
}
