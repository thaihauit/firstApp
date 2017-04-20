//
//  SidebarViewController.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 1/12/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FacebookShare
import Spring
import GoogleSignIn
import Google

class SidebarViewController: UIViewController , FlexibleTableViewDelegate , LoginViewControllerDelegate , GIDSignInDelegate{
    @IBOutlet weak var btnLogout: UIButton!
    var table_data = Array<TableData>()
    struct TableData
    {
        var section:String = ""
        var name = Array<String>()
        init(){}
    }

    var tableView: FlexibleTableView!
    var currentMod : loginMod?
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        common.sharedInstance.customImageView(image: imageUser)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
        var new_elements = TableData ()
            new_elements.section = "ĐĂNG NHẬP"
            table_data.append(new_elements)
        var new_elements1 = TableData ()
            new_elements1.section = "SẢN PHẨM"
            new_elements1.name = ["Tem nữ trang","Mực in" , "Mực lõi in"]
        table_data.append(new_elements1)
        var new_elements2 = TableData ()
            new_elements2.section = "HƯỚNG DẪN"
            new_elements2.name = ["Hướng dẫn sử dụng","Hướng dẫn đặt hàng" ]
        table_data.append(new_elements2)
        var new_elements3 = TableData ()
            new_elements3.section = "LIÊN HỆ"
        table_data.append(new_elements3)
        
        tableView = FlexibleTableView(frame: sliderView.bounds, delegate: self)
        print(tableView.frame)
        
        tableView.backgroundColor = UIColor.clear
        sliderView.addSubview(tableView)
        
        
        checkStateSigninFB ()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = "843465125654-vn66vv1keklt1i7ntb379sdmr6u2g3gh.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        
        if GIDSignIn.sharedInstance().hasAuthInKeychain() == true {
           GIDSignIn.sharedInstance().signInSilently()
        } else {
            //
        }
    }
    
    
    func checkStateSideMenu () {
        
        
        switch self.currentMod! {
        case .Facebook:
            
            print("")
            //
        case .Google:
            
            print("")
        default:
            print("")
        }
        
        
        
    }
    
    
    
    
    //MARK: Facebook delegate
    
    func checkStateSigninFB () {
        if AccessToken.current == nil {
            print("No")
            // User is logged in, use 'accessToken' here.
        } else {
            AccessToken.refreshCurrentToken { (token, error) in
                //
                print(token!)
                
                LoginApi.sharedInstance.getProfileFacebookUser(success: { (dic) in
                    
                    print(dic)
                    
                    let id = dic.value(forKey: "id") as! String
                    let url = NSURL(string: "https://graph.facebook.com/\(id)/picture?type=large&return_ssl_resources=1")
                    if let urlString = url?.absoluteString {
                        ImageLoader.sharedLoader.imageForUrl(urlString: urlString, completionHandler: { (image, string) in
                            DispatchQueue.main.async {
                                self.imageUser.image = image
                            }
                        })
                    }
                    
                }, failure: {
                    
                })
            }
            
        }

    }
    
    func didSignInSuccessFB () {
        checkStateSigninFB ()
    }
    
    
    //MARK: Google - GIDSignInDelegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error {
            print(err)
            return
        }
        let fullName = user.profile.name
        let email = user.profile.email
        print(email!)
        print(fullName!)
    }
    
    
    // Finished disconnecting |user| from the app successfully if |error| is |nil|.
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table_data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfSubRowsAt indexPath: IndexPath) -> Int {

        return table_data[indexPath.row].name.count
    }
    
    func tableView(_ tableView: UITableView, shouldExpandSubRowsOfCellAtIndexPath indexPath: IndexPath) -> Bool {
        if (indexPath.row == 0) {
            return true
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = FlexibleTableViewCell(style:.default, reuseIdentifier:"cell")
        
        cell.textLabel!.text = table_data[indexPath.row].section
        
        if  table_data[indexPath.row].name.count == 0  {
            cell.expandable = false
        } else {
            cell.expandable = true
       }
       
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        if indexPath.row  == 0 {
            let loginVC = LoginViewController()
                loginVC.delegate = self
            self.present(loginVC, animated: true, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: FlexibleTableView, didSelectSubRowAt indexPath: FlexibleIndexPath) {
        print(indexPath.subRow - 1)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForSubRowAt indexPath: FlexibleIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default, reuseIdentifier:"cell")
        cell.backgroundColor = UIColor.groupTableViewBackground
        cell.textLabel!.text = table_data[indexPath.row].name[indexPath.subRow - 1]
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
}










