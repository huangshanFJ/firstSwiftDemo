//
//  Request+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Request {
    public func responseSwiftyJSON(completionHander:(NSURLRequest,NSHTTPURLResponse?,SwiftyJSON.JSON,ErrorType?) -> Void) -> Self {
        return responseSwiftyJSON(nil, options: NSJSONReadingOptions.AllowFragments, completionHandler: completionHander)
    }
    
    public func responseSwiftyJSON(queue:dispatch_queue_t? = nil, options:NSJSONReadingOptions = .AllowFragments, completionHandler:(NSURLRequest, NSHTTPURLResponse?,JSON,ErrorType?) -> Void) -> Self {
        return responseJSON(queue: queue,options:options,completionHandler: { (response) -> Void in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { 
                var responseJSON : JSON
                if response.result.error != nil {
                    responseJSON = JSON.null
                } else {
                    responseJSON = SwiftyJSON.JSON(response.result.value!)
                }
                dispatch_async(queue ?? dispatch_get_main_queue(), { 
                    completionHandler(self.request!, self.response, responseJSON, response.result.error)
                })
            })
        })
    }
}