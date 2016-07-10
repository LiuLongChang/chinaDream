//
//  Utils.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation

public typealias CompletionHandler = ()->()


class Utils {

    
    class func documentPath()->String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }
    
    class func appGroupDocumentPath(appGroupId:String)->String{
        let url = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(appGroupId)
        let path = url?.absoluteString.stringByReplacingOccurrencesOfString("file:", withString: "",options: .LiteralSearch,range: nil)
        return path!
    }
    
}



// MARK: GCD
var GlobalMainQueue: dispatch_queue_t{
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {

    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)

}


var GlobalUtilityQueue: dispatch_queue_t{

    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)

}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}



//MARK: Delay
func executeAfterDelay(seconds:Double,completion:(()->Void)){
    
    let delayInSeconds: Double = seconds
    let popTime = dispatch_time(DISPATCH_TIME_NOW,Int64(Double(NSEC_PER_SEC) * delayInSeconds))
    dispatch_after(popTime, dispatch_get_main_queue()) { 
        completion()
    }
    
}
















