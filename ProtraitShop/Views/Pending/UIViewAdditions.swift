//
//  UIViewAdditions.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFrmNib() -> UIView? {
        var nibName = NSStringFromClass(self).componentsSeparatedByString(".").last!
        var elements: [UIView] = (NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil) as? [UIView])!
        var thisView: UIView?
        for item in elements {
            if item.isKindOfClass(self) {
                thisView = item
                break
            }
        }
        
        return thisView
    }
}