//
//  DEBUGLog.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation


#if DEBUG


    func DEBUGLog(msg: String?,fileName:NSString = #file, function:String = #function,line: Int = #line){
        
        NSLog("[\(fileName.lastPathComponent):\(line)] \(function) - \(message.debugDescription)")
        
        
    }


    
    func DEBUGLog(message: AnyObject?, filename: NSString = #file, function: String = #function, line: Int = #line) {
        NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message.debugDescription)")
    }
    
    
    
    func DEBUGPrint(message: Any?){
        
        guard message != nil else { return }
        print(message)
        
    }




#else

    
    func DEBUGLog(message: String?, filename: String = #file, function: String = #function, line: Int = #line) { }
    
    func DEBUGLog(message: AnyObject?, filename: NSString = #file, function: String = #function, line: Int = #line) { }
    
    func DEBUGPrint(message: Any?) { }






#endif