//
//  IBBSToken.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation
import SwiftyJSON


private let kLoginFeedbackJson = "kLoginFeedbackJson"
struct IBBSLoginKey {
    
    var uid: Int!
    var token: String!
    var isAdmin : Bool!
    var expiry: NSDate!
    var sex: String!
    var avatar: NSURL!
    var username: String!
    var themeColor: UIColor!
    
    
    init(){
        
        guard let json = tokenJson else { return }
        let model = IBBSLoginModel(json: json)
        
        self.uid = model.userId
        self.token = model.token
        self.isAdmin = model.isAdmin
        self.expiry = model.expire
        self.avatar = model.avatar
        self.username = model.userName
        
    }
    
    
    var isValid: Bool {
        let toast = {
            IBBSToast.make(TOKEN_LOST_EFFECTIVENESS,interval: TIME_OF_TOAST_OF_TOKEN_ILLEGAL)
        }
        guard token != nil && uid != nil else {
            toast()
            return false
        }
        let valid = expiry.timeIntervalSinceNow > 0
        if !valid { toast() }
        return valid
    }
    
    
    
    private var tokenJson: JSON? {
        guard let data = NSUserDefaults.standardUserDefaults().objectForKey(kLoginFeedbackJson) else { return nil}
        guard let json = NSKeyedUnarchiver.unarchiveObjectWithData(data as! NSData) else {
            return nil
        }
        return JSON(json)
    }
    
    
    static func saveTokenJson(json: AnyObject){
    
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(json), forKey: kLoginFeedbackJson)
        NSUserDefaults.standardUserDefaults().synchronize()
    
    }
    
    
    static func modifyUserName(username:String){
        
        guard let json = IBBSLoginKey().tokenJson else { return }
        guard var dic = json.dictionaryObject else {
            return
        }
        
        dic["username"] = username
        let newJson = JSON(dic)
        saveTokenJson(newJson.object)
        
    }
    
    
    
    static func modifyAvatarUrl(url:String){
    
        guard let _ = NSURL(string:url) else { return }
        
        
        guard let json = IBBSLoginKey().tokenJson else { return }
        
        print(json)
        
        
        guard var dic = json.dictionaryObject else {
            return
        }
        
        
        dic["avatar"] = url
        
//        re - convert to json
        let newJson = JSON(dic)
//        save
        saveTokenJson(newJson.object)
        
    }
    
    
    
}