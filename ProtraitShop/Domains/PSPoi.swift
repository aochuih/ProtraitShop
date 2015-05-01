//
//  PSPoi.swift
//  ProtraitShop
//
//  Created by aochuih on 15/4/30.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import Foundation

class PSPoi: AnyObject {
    var ID: Int!
    var name: String!
    var logoUrl: String!
    var description: String!
    var priceZone: String!
    var status: Int
    
    init() {
        ID = 0
        name = ""
        logoUrl = ""
        description = ""
        priceZone = ""
        status = 0
    }
    
    init(dictionary: NSDictionary) {
        ID = dictionary["id"] as! Int
        name = dictionary["name"] as! String
        logoUrl = dictionary["logo"] as! String
        description = dictionary["intro"] as! String
        priceZone = dictionary["price"] as! String
        status = dictionary["status"] as! Int
    }
}
