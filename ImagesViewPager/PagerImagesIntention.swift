//
//  PagerImagesIntention.swift
//  Voice
//
//  Created by Snapbuck 2 on 1/7/16.
//  Copyright © 2016 Snapbuck. All rights reserved.
//

import Foundation

class PagerImagesIntention : NSObject, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollViewImage: UIScrollView!
    @IBOutlet weak var pageControlImage: UIPageControl!
    
    private var pageViews: [UIImageView?] = []
    private var currentPage = 0
    
    func showImagesView (imgFileUrls:[String]) {
        
        for var i = 0; i < imgFileUrls.count; i++ {
            
            let imageView = UIImageView()
            
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
            activityIndicator.center = imageView.center
            activityIndicator.hidesWhenStopped = true
            
            imageView.sd_setImageWithURL(NSURL(string: imgFileUrls[i]),
                placeholderImage: UIImage(named:""),
                options: .RetryFailed,
                completed: { (image, error, cachedType, url) -> Void in
                    activityIndicator.removeFromSuperview()
            })
            imageView.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            
            self.pageViews.append(imageView)
            
        }
        
        self.setupImageForScrollView()
    }
    
    private func setupImageForScrollView () {
        
        //self.pageControl.currentPage = 0
        self.pageControlImage.numberOfPages = pageViews.count
        
        let pagesScrollViewSize = self.scrollViewImage.frame.size
        self.scrollViewImage.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(self.pageViews.count),
            height: pagesScrollViewSize.height)
        
        self.loadVisiblePages()
    }
    
    private func loadVisiblePages() {
        
        for var i = 0; i < pageViews.count; i++ {
            loadPage(i)
        }
    }
    
    private func loadPage(page: Int) {
        if page < 0 || page >= pageViews.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        var frame = scrollViewImage.bounds
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0.0
        
        if let newPageView = pageViews[page] {
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollViewImage.addSubview(newPageView)
            
            pageViews[page] = newPageView
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = scrollViewImage.frame.size.width
        let page = Int(floor((scrollViewImage.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        self.pageControlImage.currentPage = page
    }
    
}




