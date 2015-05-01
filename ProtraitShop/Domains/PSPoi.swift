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

enum PSPhotoType {
    case PhotoProtrait(ID: Int, name: String, price: Float)
    case PhotoFullSize(ID: Int, name: String, price: Float)
}

class PSPoi: NSObject {
    var ID: Int!
    var name: String!
    var logoUrl: String!
    var introduction: String!
    var priceZone: String!
    var status: PoiStatusType!
    var supportPhotoTypes: [PSPhotoType]?
    var score: Float?
    var gallery: [String]?
    var readme: String?
    var commentCount: Int?
    var comments: [PSPoiComment]?
    
    override init() {
        ID = 0
        name = ""
        logoUrl = ""
        introduction = ""
        priceZone = ""
        status = .Open
    }
    
    init(dictionary: NSDictionary) {
        ID = dictionary["id"] as! Int
        name = dictionary["name"] as! String
        logoUrl = dictionary["logo"] as! String
        introduction = dictionary["intro"] as! String
        priceZone = dictionary["price"] as! String
        status = PoiStatusType(rawValue: dictionary["status"]!.integerValue)
        
        score = dictionary["score"] as? Float
        readme = dictionary["readMe"] as? String
        if let galleryDictionaries = (dictionary["gallery"] as? [NSDictionary]) {
            galleryDictionaries.map {
                $0 as! String
            }
        }
        
        if let types = (dictionary["type"] as? [NSDictionary]) {
            supportPhotoTypes = types.map {
                var ID = $0["id"] as! Int
                if ID == 0 {
                    return PSPhotoType.PhotoProtrait(ID: $0["id"]! as! Int, name: $0["name"]! as! String, price: $0["price"]! as! Float)
                } else {
                    return PSPhotoType.PhotoFullSize(ID: $0["id"]! as! Int, name: $0["name"]! as! String, price: $0["price"]! as! Float)
                }
            }
        }
        
        if let commentDictionaries = (dictionary["comments"] as? [NSDictionary]) {
            comments = commentDictionaries.map {
                PSPoiComment(dictionary: ($0 as NSDictionary))
            }
        }
    }
    
}
