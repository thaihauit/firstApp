//
//  ProductViewController.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 1/12/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ProductViewController: UIViewController , UIPageViewControllerDataSource , UIPageViewControllerDelegate, UIScrollViewDelegate {
     var revealController  = SWRevealViewController()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControlView: UIView!
    @IBOutlet weak var constantHeight: NSLayoutConstraint!
    
    var currentPage = Int()
    var pageController = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set delegate of navigation controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.navDelegate = self.navigationController
        
        if AccessToken.current == nil {
            
            print("No")
            // User is logged in, use 'accessToken' here.
        } else {
            
            print("Yes")
            
        }
        
        // Do any additional setup after loading the view.
        
        showPageViewController()
        
//        let passWordMD5 = common.sharedInstance.MD5(string: "1")
//        let md5String = String(format: "%@%@%@%@%@%@","@" , "CheckLogin" , "admin" , "&" , passWordMD5! , "@" )
//        let sercurityCode = common.sharedInstance.MD5(string: md5String)
//        
//        let params = NSMutableDictionary()
//        params.setValue("admin", forKey: "pUserName")
//        params.setValue(passWordMD5, forKey: "pPassword")
//        params.setValue(sercurityCode, forKey: "pSercurityCode")
//        
//        
//        ServiceApi.sharedInstance.sendJsonDataRequest_AsySynchronous(uriString: "http://192.168.1.251:8089/GoldRetailMobile.svc/CheckLogin", httpMethod: "POST", params: params,
//             success: { (data, statusCode, error) in
//                
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data! as Data , options: []) as? NSDictionary
//                    
//                        let result = (json?["Result"]! as AnyObject).description
//                    
//                        print(result!)
//                    
//                } catch {
//                    
//                }
//            },
//             failure: { (error) in
//                
//                print("lỗi cmnr")
//                    
//        })
    }
    
    
    override func viewDidLayoutSubviews()
    {
        let screenHeight = UIScreen.main.bounds.size.height
        self.constantHeight.constant = screenHeight / 3
        
        var scrollViewInsets = UIEdgeInsets.zero
        scrollViewInsets.top = 0
        scrollView.contentInset = scrollViewInsets
    }
    
    
    
    
    //MARK: - Page viewcontroller
    
    func showPageViewController()  {
        
        // Set timer when automatic scrolling page view controller
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(loadNextPageViewcontroller), userInfo: nil, repeats: true)
        
        // Init new page viewcontroller
        pageController = UIPageViewController.init(transitionStyle: .scroll,
                                                   navigationOrientation: .horizontal,
                                                   options: nil)
        pageController.dataSource = self
        
        // Set frame page controller
        pageController.view.frame = CGRect(x: 0, y: 0, width: self.pageControlView.bounds.size.width, height: self.pageControlView.bounds.size.height  )

        let initialViewController = self.viewControllerAtIndex(index: 0)
        
        let viewControllers  = NSArray(objects: initialViewController)
            pageController.setViewControllers(viewControllers as? [UIViewController],
                                              direction: .forward,
                                              animated: true) {
                                                (Bool) -> Void in
                                            }

        self.addChildViewController(pageController)
        self.pageControlView.addSubview(self.pageController.view)
        self.pageController.didMove(toParentViewController: self)
        self.pageControlView.bringSubview(toFront: pageController.view)
    }
    
    /**
     Set index of page view controller when call
     */
    func viewControllerAtIndex (index : Int ) -> PageContentViewController {
        let childViewController = PageContentViewController(nibName: "PageContentViewController", bundle: nil)
            childViewController.index = index
        self.currentPage = index
        return childViewController
    }
    
    
    /**
     Set staus page viewcontroler when scroll before
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).index
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    /**
     Set staus page viewcontroler when scroll after
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).index
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == 3 {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    /**
     Returns the number of items to be reflected in the page indicator.
     */
    private func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    /**
     Returns the index of the selected item to be reflected in the page indicator.
     */
    private func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return currentPage
    }
    
    
    func loadNextPageViewcontroller () {
        if currentPage >= 2 {
            currentPage = 0
        } else {
            currentPage += 1
        }
        
        
        let initialViewController = self.viewControllerAtIndex(index: currentPage)
        let viewControllers  = NSArray(objects: initialViewController)
        pageController.setViewControllers(viewControllers as? [UIViewController] , direction: .forward, animated: true) { (Bool) -> Void in
        }
    }
    
    
    
    @IBAction func btnLeftMenu(_ sender: UIButton) {
        
        revealController = revealViewController()
        revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
        revealController.revealToggle(animated: true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
