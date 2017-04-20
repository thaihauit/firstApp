//
//  common.swift
//  PMVBanLeMobile
//
//  Created by PMV-MACMINI on 1/29/16.
//  Copyright © 2016 Ha.Nguyen. All rights reserved.
//

import UIKit
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork



extension NSDictionary {
    func deNullStringForKey(aKey: String) -> String {
        let obj = self.object(forKey: aKey)
        if let str = obj as? String {
            return str as String!;
        } else if let int = obj as? NSNumber {
            return int.stringValue;
        } else {
            return ""
        }
    }
}


extension Array where Element: AnyObject {
    var indexedDictionary: [Int:Element] {
        var result: [Int:Element] = [:]
        for (index, element) in enumerated() {
            result[index] = element
        }
        return result
    }
}


// set color with hex value
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


extension String.Index{
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    func advance(_ offset:Int, `for` string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}


extension String {
    
    init?(urlString : String) {
        let string = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        self.init(string!)!
    }
    
    init?(htmlEncodedString: String) {
        let encodedData = htmlEncodedString.data(using: String.Encoding.utf8)!
        let attributedOptions : [String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType as AnyObject,
            NSCharacterEncodingDocumentAttribute: String.Encoding.utf8 as AnyObject
        ]
        var urlString = String()
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            urlString = attributedString.string
        } catch {
            
        }
        self.init(urlString)!
    }
    
    
    func isCheckExpresstion(type : String) -> Bool {
        var regex = NSRegularExpression()
        if type == TYPE.LICENSEKEY {
             regex = try! NSRegularExpression(pattern: "^[0-9A-Z]{5}(?:-[0-9A-Z]{5})(?:-[0-9A-Z]{5})(?:-[0-9A-Z]{5})(?:-[0-9A-Z]{5})",
                                                 options: [.caseInsensitive])
        }
        if type == TYPE.EMAIL {
            regex = try! NSRegularExpression(pattern: "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$", options: NSRegularExpression.Options.caseInsensitive)
        }
        return regex.firstMatch(in: self, options:[],
            range: NSMakeRange(0, utf16.count)) != nil
    }
    
}

    class common: NSObject {
        class var sharedInstance: common {
            struct Singleton {
                static let instance: common = common()
            }
            return Singleton.instance
    }
        
    
    func addImageIcon(imageView : UIImageView , textField : UITextField) {
        let leftView = UIView()
        leftView.addSubview(imageView)
        
        leftView.frame = CGRect(x: 0, y: 0, width: textField.bounds.size.height, height:textField.bounds.size.height  )
        
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height:24  )
        imageView.center = leftView.center
        textField.leftViewMode = UITextFieldViewMode.always
        textField.leftView = leftView
    }
        
    func addLineBottomTo(textField : UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: textField.bounds.size.height - 1, width:  textField.bounds.size.width, height: textField.bounds.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
        
    func customButton(object: AnyObject) {
            object.layer.cornerRadius = 5
            object.layer.masksToBounds = true
            object.layer.borderWidth = 2
            object.layer.borderColor = UIColor.white.cgColor
            object.layer.shadowColor = UIColor.white.cgColor
            object.layer.shadowOffset = CGSize(width: 2, height: 2)
            object.layer.shadowOpacity = 2
    }
        
    func customImageView (image : UIImageView) {
            image.layer.cornerRadius = image.frame.size.height / 2
            image.layer.masksToBounds = true
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.shadowColor = UIColor.white.cgColor
            image.layer.shadowOffset = CGSize(width: 2, height: 2)
            image.layer.shadowOpacity = 1
    }
        
    func shadowView (yourView : UIView) {
        yourView.layer.cornerRadius = 5
        yourView.layer.masksToBounds = true
        yourView.layer.borderWidth = 0.2
        yourView.layer.borderColor = UIColor.brown.cgColor
        yourView.layer.shadowColor = UIColor.brown.cgColor
        yourView.layer.shadowOffset = CGSize(width: 0, height: 0)
        yourView.layer.shadowOpacity = 0.5
        
    }
    
    /**
     convert string to MD5
     */
    func MD5(string: String) -> String? {
        guard let messageData = string.data(using:String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData.map { String(format: "%02hhx", $0) }.joined()
    }
    
    
        
    func getKeySecretOfApp () -> String {
            let bundleId = Bundle.main.bundleIdentifier
        
        return bundleId! + "PMV"
    }
        
    /**
    get locallozied String
    */
    func localizedStringForStringID(string : String) -> String {
        var localizedString = NSString()
        localizedString = NSLocalizedString(string as String, comment: "") as NSString
        return localizedString as String
        
    }
    
        
    func subDateTime (Str_fromDay : String , Str_toDay : String ) -> ( Double ,  Int)  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date1 = dateFormatter.date(from: Str_fromDay)!
        let date2 = dateFormatter.date(from: Str_toDay)!
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = DateComponentsFormatter.UnitsStyle.full
        
        let interval = date2.timeIntervalSince(date1)
        let subdate = Int ( interval / 86400 )
        return ( interval , subdate )
    }
    
    /**
     get CurrentDate
     */
    func getCurrentDate () -> String {
        let todaysDate:NSDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let DateInFormat:String = dateFormatter.string(from: todaysDate as Date)
        return DateInFormat
    }
    
    
    /**
     get CurrentTime
     */
    func getCurrentTime () -> String {
        let todaysDate:NSDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let DateInFormat:String = dateFormatter.string(from: todaysDate as Date)
        return DateInFormat
    }
    
    
    /**
     convert Date to String
     */
    func convertDatetoString (date : NSDate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale =  NSLocale.system
        let Str = dateFormatter.string(from: date as Date) 
        return Str
        
    }
    
    func convertStringToInt(string : String) -> Int {
        let value = string.replacingOccurrences(of: ",", with: "")
        if Int (value) == nil {
            return 0
        }
        return Int (value)!
    }
    

    func convertStringToDouble (string : String) -> Double {
        let value = string.replacingOccurrences(of: ",", with: "")
        if Double (value) == nil {
            return 0
        }
        return Double (value)!
    }
    
    
    /**
     sub string cut end index object
     */
    func substring(string : String ) -> String {
        var subString : String = String()
        if string.isEmpty == true {
            subString = ""
        } else {
            subString = string.substring(to: string.endIndex.predecessor(in: string))
        }
        return subString
    }
    
    
    
    /**
     custom Placeholder     
    */
    func customPlaceholder (textfield : UITextField , string : String) {
        textfield.attributedPlaceholder = NSAttributedString(string: string ,
            attributes:[NSForegroundColorAttributeName: UIColor.white])
    }

    func setValueForKey (value : AnyObject , key : String  , type : String ) {
        let defaults = UserDefaults.standard
        if type == TYPE.STRING {
            defaults.setValue(value, forKey: key)
        }
        if type == TYPE.OBJECT {
            defaults.set(value, forKey: key)
        }
        
        defaults.synchronize()
    }
    
    func getValueForKey (key : String , type : String) -> AnyObject {
        let defaults = UserDefaults.standard
        
        if type == TYPE.OBJECT {
            if defaults.object(forKey: key) == nil {
                return 0 as AnyObject
            } else {
                return (defaults.object(forKey: key))! as AnyObject
            }
        }
        if defaults.value(forKey: key) == nil {
            return "0" as AnyObject
        }
        return (defaults.value(forKey: key))! as AnyObject
    }
    
    
}

