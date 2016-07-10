//
//  IBBSContext.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation
import SwiftyJSON


class IBBSContext{
    
    private static let kNodesId = "kNodes"
    private static let kLoginFeedback = "kLoginFeedbackJson"
    
//    MARK: - Login
    static func loginIfNeeded(alertMessage message:String,completion:CompletionHandler){
        
        
        let key = IBBSLoginKey()
        guard !key.isValid else {
            completion()
            return
        }
        
        
        let msg = message ?? PLEASE_LOGIN
        let loginAlertController = UIAlertController(title: BUTTON_OK,message: msg,preferredStyle: .Alert)
        let okAction = UIAlertAction(title: BUTTON_OK,style: .Default,handler: {(_) -> Void in
        
            
            let vc = IBBSEffectViewController()
            vc.modalTransitionStyle = .FlipHorizontal
            UIApplication.topMostViewController?.presentViewController(vc, animated: true, completion:nil)
            
            
            IBBSContext.login(cancelled: {
                
                vc.dismissViewControllerAnimated(true, completion: nil)
                
                }, completion: {
                    
                    vc.dismissViewControllerAnimated(true, completion: nil)
                    
                    completion()
                    
            })
            
        })
        
        let cancelAction = UIAlertAction(title: BUTTON_CANCEL, style: .Cancel , handler: nil)
        loginAlertController.addAction(cancelAction)
        loginAlertController.addAction(okAction)
        
        UIApplication.topMostViewController?.presentViewController(loginAlertController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    static func login(cancelled cancelled:CompletionHandler? = nil,completion: CompletionHandler?){
    
    
        var username,password: UITextField!
        let alertVC = UIAlertController(title: BUTTON_LOGIN,message: INSERT_UID_AND_PASSWD,preferredStyle: .Alert)
        alertVC.addTextFieldWithConfigurationHandler { (textField:UITextField) in
            
            textField.placeholder = HOLDER_USERNAME
            username = textField
            
        }
        
        alertVC.addTextFieldWithConfigurationHandler { (textField:UITextField) in
            
            textField.placeholder = HOLDER_USERNAME
            username = textField
            
        }
        
        
        let okAction = UIAlertAction(title: BUTTON_OK,style: .Default){(action:UIAlertAction)->Void in
            
            
            
            let encryptedPasswd = password.text?.MD5()
            
        
        
        
        }
        
        
    
    
    
    }
    
    
    
    
    
    
}