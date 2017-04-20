/**
 constant.swift
 PMV GoldSoftware
 Created by PMV-MACMINI on 12/26/16.
 Copyright © 2016 Ha.Nguyen. All rights reserved.
 */


import Foundation


struct TYPE {
    static let STRING = "string"
    static let OBJECT = "object"
    
    //========>
    static let LICENSEKEY   = "0"
    static let EMAIL        = "1"
}

enum state {
    case post
    case get
    case put
}
enum loginMod {
    case Facebook
    case Google
    case Normal
}





