//
//  PSHomeViewController.swift
//  ProtraitShop
//
//  Created by aochuih on 15/4/28.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSHomeViewController : UIViewController, UITableViewDataSource, UITableViewDelegate  {
    private var tableView: UITableView!
    private var poiArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.delegate = self;
        tableView.dataSource = self;
        view.addSubview(self.tableView)
    }

    // TableView DataSource & Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        return cell
    }
}
