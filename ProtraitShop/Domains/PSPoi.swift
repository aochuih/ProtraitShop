//
//  PSPoi.swift
//  ProtraitShop
//
//  Created by aochuih on 15/4/30.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import Foundation

enum PoiStatusType: Int {
    case Open = 0, Busy = 1, Close = 2
    
    func description() -> String {
        switch self {
        case .Open:
            return ""
        case .Busy:
            return "店家忙"
        case .Close:
            return ""
        }
    }
}

class PSPoi: AnyObject {
    var ID: Int!
    var name: String!
    var logoUrl: String!
    var description: String!
    var priceZone: String!
    var status: PoiStatusType!
    
    init() {
        ID = 0
        name = ""
        logoUrl = ""
        description = ""
        priceZone = ""
        status = .Open
    }
    
    init(dictionary: NSDictionary) {
        ID = dictionary["id"] as! Int
        name = dictionary["name"] as! String
        logoUrl = dictionary["logo"] as! String
        description = dictionary["intro"] as! String
        priceZone = dictionary["price"] as! String
        status = PoiStatusType(rawValue: dictionary["status"]!.integerValue)
    }                                                                  
    
}
