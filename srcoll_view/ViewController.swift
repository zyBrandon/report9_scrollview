//
//  ViewController.swift
//  srcoll_view
//
//  Created by 周越 on 2018/11/24.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: UIImage(named: "1"))
        scroll.addSubview(image)
        scroll.contentSize = image.bounds.size
        
        
        
        for i in 1...3{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        scrollView.contentSize = CGSize(width: 3*scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.delegate = self
        pageController.numberOfPages = 3
        pageController.currentPage = 0
        pageController.isUserInteractionEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    @IBAction func pageClicked(_ sender: Any) {
        let rect = CGRect(x: CGFloat(pageController.currentPage)*scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
}

