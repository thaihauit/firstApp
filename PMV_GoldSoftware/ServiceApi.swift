/**
 ServiceApi.swift
 PMVBanLeMobile
 Created by PMV-MACMINI on 1/11/16.
 Copyright © 2016 Ha.Nguyen. All rights reserved.
 */

import UIKit


class ServiceApi: NSObject , NSURLConnectionDelegate, XMLParserDelegate , URLSessionDelegate {
   
    class var sharedInstance: ServiceApi {
        struct Singleton {
            static let instance: ServiceApi = ServiceApi()
        }
        return Singleton.instance
    }

    /**
     send request with no params
     */
    func sendRequest(uriString: String , httpMethod : String  , success:  @escaping (Data?, Int?, Error?)  -> Void , failure:  @escaping () -> Void )  -> Void {
        let urlString = String(urlString: uriString)
        print(urlString as Any)
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: NSURL(string: uriString) as! URL)
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.httpMethod = httpMethod
            request.httpBody = uriString.data(using: String.Encoding.utf8)
        DispatchQueue.global(qos: .utility).async {
            let task = session.dataTask(with: request as URLRequest ,  completionHandler: { data, response, error in
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                DispatchQueue.main.async {
                    if statusCode == 200 {
                        success(data , statusCode, error )
                    } else {
                        failure()
                    }
                }
            })
            task.resume()
        }
    }
   
    
    /**
     send request json data with asysynchronous
     */
    func sendJsonDataRequest_AsySynchronous(uriString: String , httpMethod : String , params : NSMutableDictionary , success: @escaping (_ data: NSData?,_ reponse: Int?,_ error : NSError?) -> Void , failure: @escaping (_ error : NSError?) -> Void) -> Void {
        let urlString = String(urlString: uriString)
        print(urlString as Any)
        let request = NSMutableURLRequest(url: NSURL(string: uriString)! as URL)
        var session = URLSession.shared
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest  = 60
        urlconfig.timeoutIntervalForResource = 60
        session = URLSession(configuration: urlconfig, delegate: self, delegateQueue: nil)
        request.httpMethod = httpMethod
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            
            failure(error as NSError?)
        }
        
        DispatchQueue.global(qos: .utility).async {
            let task = session.dataTask(with: request as URLRequest ,  completionHandler: { data, response, error in
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                DispatchQueue.main.async {
                    if statusCode == 200 {
                        success(data as NSData?, statusCode, error as NSError?)
                    } else {
                        failure(error as NSError?)
                    }
                    
                }
            })
            task.resume()
        }
    }
}

