//
//  PageContentViewController.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 1/16/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
   
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageImage: UIImageView!
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        switch index {
        case 0:
            pageImage.image = UIImage(named: "1.jpg")
        case 1 :
            pageImage.image = UIImage(named: "2.jpg")
        case 2:
            pageImage.image = UIImage(named: "3.jpg")
            
        default:
            break
        }
        self.pageControl.currentPage = index

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
