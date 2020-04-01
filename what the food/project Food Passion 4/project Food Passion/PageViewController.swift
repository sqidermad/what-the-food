//
//  PageViewController.swift
//  project Food Passion
//
//  Created by Evelyn on 01/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIScrollView!
    @IBOutlet weak var scrollPage: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var labelName: UILabel!
    var images: [String] = ["0","1","2","3","4"]
    var labels: [String] = ["Find Your Healthy Food","Know What You Eat","Make Your Healthy Food","Track What You Eat","Sign-Up for More!"]
    var frame = CGRect(x:0,y:0,width:0,height:0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.applyRoundCorner(nextButton)
        scrollPage.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.x = pageControl.frame.size.width * CGFloat(index)
            frame.size = pageControl.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            self.pageControl.addSubview(imgView)
            
        }
        pageControl.contentSize = CGSize(width: (pageControl.frame.size.width * CGFloat(images.count)), height: pageControl.frame.size.height)
        pageControl.delegate = self
        nextButton.isEnabled = false
        nextButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //scrollview method

    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 50
        object.layer.masksToBounds = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = pageControl.contentOffset.x / pageControl.frame.size.width
        scrollPage.currentPage = Int(pageNumber)
        let index: Int = Int (pageNumber)
        labelName.text = labels[index]
        print("\(labelName.text)")
        if index == 4 {
            nextButton.isHidden = false
            scrollPage.isHidden = true
            nextButton.isEnabled = true
        }
        else {
            nextButton.isHidden = true
            scrollPage.isHidden = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
