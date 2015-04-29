//
//  PSTabBarController.swift
//  ProtraitShop
//
//  Created by aochuih on 15/4/29.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSTabBarController: UITabBarController {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: "", bundle: nil)
        
        var homeViewController = PSHomeViewController()
        homeViewController.title = "小店"
        homeViewController.tabBarItem = UITabBarItem(title: "小店", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        var homeNavigationViewController = UINavigationController(rootViewController: homeViewController)
        var mineViewController = PSMineViewController()
        mineViewController.title = "我的"
        mineViewController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        var mineNavigationViewController = UINavigationController(rootViewController: mineViewController)
        var moreViewController = PSMoreViewController()
        moreViewController.title = "更多"
        moreViewController.tabBarItem = UITabBarItem(title: "更多", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        var moreNavigationViewController = UINavigationController(rootViewController: moreViewController)
        
        var controllers = [UIViewController]()
        controllers.append(homeNavigationViewController)
        controllers.append(mineNavigationViewController)
        controllers.append(moreNavigationViewController)
        viewControllers = controllers
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
