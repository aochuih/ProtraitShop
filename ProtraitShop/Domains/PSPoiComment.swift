//
//  PSPoiComment.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSPoiComment: NSObject {
    var ID: Int!
    var name: String!
    var ctime: String!
    var content: String!
    var pics: [String]?
    
    override init() {
        ID = 0
        name = ""
        ctime = ""
        content = ""
    }
    
    init(dictionary: NSDictionary) {
        ID = dictionary["id"] as! Int
        name = dictionary["name"] as! String
        ctime = dictionary["ctime"] as! String
        content = dictionary["content"] as! String
        
        if let picDictionaries = (dictionary["pics"] as? [NSDictionary]) {
            pics = picDictionaries.map {
                $0 as! String
            }
        }
    }
}
