//
//  LoginView.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 2/20/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit
protocol LoginViewDelegate {
    func didTappedButtonLoginByFacebook()
    func didTappedButtonLoginByGoogle()
}

class LoginView: UIView , UITextFieldDelegate {
    var delegate : LoginViewDelegate?
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnNewRegister: UIButton!

    override func awakeFromNib() {
        customTextfield ()
        common.sharedInstance.addLineBottomTo(textField: txtEmail)
        common.sharedInstance.addLineBottomTo(textField: txtPassword)
        common.sharedInstance.customButton(object: btnLogin)
        common.sharedInstance.customButton(object: btnNewRegister)
        common.sharedInstance.customPlaceholder(textfield: txtEmail, string: "Email")
        common.sharedInstance.customPlaceholder(textfield: txtPassword, string: "Password")
        
        // Do any additional setup after loading the view.
        txtEmail.delegate = self
        txtPassword.delegate = self
        
    }
    
    func customTextfield () {
        let imageName_email = "email-ic.png"
        let image_email = UIImage(named: imageName_email)
        let imageView_Email = UIImageView(image: image_email!)
        common.sharedInstance.addImageIcon(imageView: imageView_Email, textField: self.txtEmail)
        
        let imageName_pass = "password-ic.png"
        let image_pass = UIImage(named: imageName_pass)
        let imageView_pass = UIImageView(image: image_pass!)
        common.sharedInstance.addImageIcon(imageView: imageView_pass, textField: self.txtPassword)
    }
    
    @IBAction func didTappedButtonLogin(_ sender: UIButton) {
        
    }
    
    
    @IBAction func didTappedButtonForgetPassword(_ sender: UIButton) {
    }
    
    @IBAction func didTappedButtonNewRegister(_ sender: UIButton) {
    }
    
    
    @IBAction func didTappedButtonLoginByFacebook(_ sender: UIButton) {
        self.delegate?.didTappedButtonLoginByFacebook()
    }
    
    @IBAction func didTappedButtonLoginByGoogle(_ sender: UIButton) {
        self.delegate?.didTappedButtonLoginByGoogle()
    }
    
    
}
