//
//  NSDate+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation

extension NSDate {
    
    /**
     获取当前时间戳
     */
    class func getCurrentTimeStamp() -> String {
        let timeStamp : String = "\(Int64(floor(NSDate().timeIntervalSince1970 * 1000)))"
        return timeStamp
    }
    
    /**
     获取当前的年月日
     
     - returns: <#return value description#>
     */
    class func getCurrentDate() -> String {
        let formatter : NSDateFormatter = NSDateFormatter()
        formatter.dateFromString("yyyy-MM-dd")
        return formatter.stringFromDate(NSDate())
    }
    
    /**
     将时间转换成时间戳
     
     - parameter date: 要转换的时间
     
     - returns: <#return value description#>
     */
    class func changeTimeStamp(date : String) -> String {
        let formatter : NSDateFormatter = NSDateFormatter()
        formatter.dateFromString("yyyy-MM-dd")
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        
        let dateNow = formatter.dateFromString(date)
        return "\(dateNow?.timeIntervalSince1970)000"
    }
    
    class func changeDate(timestamp : String) -> String {
        guard timestamp.length > 3 else {
            return ""
        }
        
        let newTimestamp = (timestamp as NSString).substringFromIndex(timestamp.length - 3)
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        formatter.dateFromString("yyyy-MM-dd HH:mm:ss")
        
        let dateStart = NSDate(timeIntervalSinceReferenceDate: Double(newTimestamp)!)
        return formatter.stringFromDate(dateStart)
    }
}






