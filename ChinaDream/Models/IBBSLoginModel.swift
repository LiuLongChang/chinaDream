//
//  IBBSLoginModel.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation
import SwiftyJSON


struct IBBSLoginModel {
    
    var message : String!
    var token: String!
    var isAdmin : Bool!
    var success: Bool!
    var expire : NSDate!
    var avatar: NSURL!
    var userId: Int!
    var userName: String!
    
    init(json: JSON){
    
        message = json["msg"].stringValue
        token = json["token"].stringValue
        isAdmin = json["is_admin"].boolValue
        success = json["code"].boolValue
        expire = NSDate(timeIntervalSince1970: json["expire"].doubleValue)
        avatar = NSURL(string: json["avatar"].stringValue)
        userId = json["uid"].intValue
        userName = json["username"].stringValue
    
    }
    
}