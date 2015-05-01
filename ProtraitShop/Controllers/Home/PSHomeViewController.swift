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
    private var poiService: PSPoiService!
    private var poiArray = [PSPoi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "PSPoiCell", bundle: nil), forCellReuseIdentifier: "poiCell")
        view.addSubview(self.tableView)
        
        poiService = PSPoiService()
        poiService.fetchPoiList("") {
            (poiArray , _) in
            self.poiArray = poiArray
            self.tableView.reloadData()
        }
    }                                                                          
    
    // TableView DataSource & Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("poiCell") as! PSPoiCell
        if indexPath.row < poiArray.count {
            var poi = poiArray[indexPath.row]
            cell.poiImageView.sd_setImageWithURL(NSURL(string: poi.logoUrl))
            cell.nameLabel.text = poi.name
            cell.descriptionLabel.text = poi.description
            cell.priceLabel.text = poi.priceZone
        }
        
        return cell
    }
}
