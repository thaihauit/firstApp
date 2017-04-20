//
//  LoginApi.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 2/22/17.
//  Copyright © 2017 Ha.Nguyen. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginApi: NSObject {
    class var sharedInstance: LoginApi {
        struct Singleton {
            static let instance: LoginApi = LoginApi()
        }
        return Singleton.instance
    }
    
    
    
    
    func getProfileFacebookUser (success:  @escaping (_ Dic : NSDictionary)  -> Void , failure:  @escaping () -> Void )  -> Void {
        
        DispatchQueue.global(qos: .utility).async {
            let graphRequest = GraphRequest(graphPath: "me" , parameters: ["fields": "id,email"])
            graphRequest.start({ (response, result ) in
                DispatchQueue.main.async {
                    switch result {
                    case .failed(let error):
                        print("error in graph request:", error)
                        break
                    case .success(let response):
                        if let responseDictionary = response.dictionaryValue {
                            print(responseDictionary)
                            success(responseDictionary as NSDictionary)
                            
                            
                        }
                    }
                }
            })
        }
    }
}
