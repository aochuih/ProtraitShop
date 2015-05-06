//
//  PSPoiDetailViewController.swift
//  ProtraitShop
//
//  Created by aochuih on 15/5/1.
//  Copyright (c) 2015年 NightWind. All rights reserved.
//

import UIKit

class PSPoiDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var contentScrollView: UIScrollView!
    var summaryView: PSPoiSummaryView!
    var galleryTableView: UITableView!
    var poi: PSPoi!
    var poiService: PSPoiService!
    var cellDictionary: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = poi.name
        cellDictionary = NSDictionary()
        poiService = PSPoiService()
        poiService.getPoiDetail("", poiID: String(stringInterpolationSegment:poi.ID)) {
            (poiDetail, error) in
            self.poi = poiDetail
            self.reloadData()
        }
        
        contentScrollView = UIScrollView(frame: CGRectMake(0, 0, view.bounds.width, view.bounds.height))
        contentScrollView.contentSize = CGSizeMake(view.bounds.width, 200)
        view.addSubview(contentScrollView)
        
        summaryView = PSPoiSummaryView.loadFrmNib() as! PSPoiSummaryView
        summaryView.frame = CGRectMake(0, 0, view.bounds.width, 200)
        contentScrollView.addSubview(summaryView)
        galleryTableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        galleryTableView.contentOffset = CGPointMake(0, summaryView.bounds.size.height)
        galleryTableView.backgroundColor = UIColor.clearColor()
        galleryTableView.delegate = self
        galleryTableView.dataSource = self
        contentScrollView.addSubview(self.galleryTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        summaryView.frame.origin = CGPointMake(0, self.topLayoutGuide.length)
        galleryTableView.frame.origin = CGPointMake(0, summaryView.frame.origin.y + summaryView.bounds.size.height)
        if let gallery = poi.gallery {
            var lastCell = galleryTableView.cellForRowAtIndexPath(NSIndexPath(forItem: poi.gallery!.count-1, inSection: 0))
            var lastCellBottom: CGFloat = 200.0
            if (lastCell != nil) {
                lastCellBottom = lastCell!.frame.origin.y + lastCell!.bounds.height
            }
            contentScrollView.contentSize = CGSizeMake(view.bounds.width, lastCellBottom)
        }
    }

    func reloadData()
    {
        summaryView.introductionLabel.text = poi.introduction
        summaryView.priceValueLabel.text = poi.priceZone
        summaryView.starValueLabel.text = String(stringInterpolationSegment: poi.score!)
        galleryTableView.reloadData()
    }
    
    // TableView DataSource & Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let gallery = poi.gallery {
            return poi.gallery!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cell = cellDictionary[NSNumber(integer: indexPath.row)] as? UITableViewCell
        if (cell != nil) {
            return cell!.bounds.height
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = cellDictionary[NSNumber(integer: indexPath.row)] as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            var imageView = UIImageView()
            imageView.sd_setImageWithURL(NSURL(string: poi.gallery![indexPath.row]))
            cell!.contentView.addSubview(imageView)
            cellDictionary.setValue(cell, forKey: String(stringInterpolationSegment: indexPath.row))
        }
        
        return cell!
    }
}
