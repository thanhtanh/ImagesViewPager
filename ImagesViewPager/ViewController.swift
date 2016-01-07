//
//  ViewController.swift
//  ImagesViewPager
//
//  Created by Snapbuck 2 on 1/7/16.
//  Copyright © 2016 T4nhpt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pagerImageHandler:PagerImagesIntention!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageUrls = [
            "http://waptai.com/wp-content/uploads/beautiful-girl-hd-wallpaper-3.jpg",
            "http://livehdwallpaper.com/wp-content/uploads/2014/09/Beautiful-English-Girl-Wallpaper.jpg",
            "http://www.tapchidanong.org/product_images/uploaded_images/hot-girl-3287387287-4-.jpg"
        ]
        
        pagerImageHandler.showImagesView(imageUrls)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

