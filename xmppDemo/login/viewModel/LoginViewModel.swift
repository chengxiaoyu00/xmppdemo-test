//
//  LoginViewModel.swift
//  xmppDemo
//
//  Created by chengxiaoyu on 2018/10/22.
//  Copyright © 2018 chengxiaoyu. All rights reserved.
//

import UIKit
import XMPPFramework
/// 负责业务逻辑 登录页面输入以及点击时需要做的业务逻辑
class LoginViewModel: NSObject  {
    
    var user:String?
    var password:String?
    static let shared:LoginViewModel = {
        let instance = LoginViewModel()
        return instance
    }()
    /// 登录
    func login() -> Void {
        if let _user = user ,let _ps = password {
            xmppManager.shared.config(user: _user, domain: "xiaoyu.com", rouser: "iphone", server: "114.116.42.231", password: _ps)
            xmppManager.shared.login { (Error) in
                debugPrint(Error)
                if Error == .success {
                    //save user password
                    
                }
            }
        }
    }
    
}
