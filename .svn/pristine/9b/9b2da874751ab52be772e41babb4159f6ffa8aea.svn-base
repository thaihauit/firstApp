//
//  LoginViewController.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 2/6/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Google
import GoogleSignIn

protocol LoginViewControllerDelegate {
    func didSignInSuccessFB ()
}

class LoginViewController: UIViewController , UITextFieldDelegate , LoginViewDelegate  , GIDSignInUIDelegate , GIDSignInDelegate {
    
    var delegate: LoginViewControllerDelegate?
    @IBOutlet weak var viewLogin: UIView!
    var isCheckLoginFB : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add subview Login
        addSubView_Login ()
        
        // Initialize sign-in
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }

    func addSubView_Login () {
        let LoginVC = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)![0] as! LoginView
            LoginVC.delegate = self
        self.viewLogin.addSubview(LoginVC)
        self.viewLogin.bounds = LoginVC.frame
    }
    
    //MARK: Login byFacebook
    
    func didTappedButtonLoginByFacebook() {
        self.loginButtonClicked()
    }
    
    func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .userFriends , .email], viewController: self) { result in
            switch result {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success (let grantedPermissions, let declinedPermissions, let accessToken):
                self.dismiss(animated: true, completion: {
                    print("Logged in!")
                    print(grantedPermissions)
                    print(declinedPermissions)
                    print(accessToken)
                    self.delegate?.didSignInSuccessFB()
                })
            }
        }
    }
    
    //MARK: Login by Google
    
    func didTappedButtonLoginByGoogle() {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    /**
     The sign-in flow has finished and was successful if |error| is |nil|.
     */
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        self.dismiss(animated: true, completion: {
            let fullName = user.profile.name
            let email = user.profile.email
            
            print(email!)
            print(fullName!)
        })
    }
    
    
    /**
     Finished disconnecting |user| from the app successfully if |error| is |nil|.
     */
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
       
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
