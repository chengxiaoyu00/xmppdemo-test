//
//  LoginModel.swift
//  xmppDemo
//
//  Created by chengxiaoyu on 2018/10/22.
//  Copyright © 2018 chengxiaoyu. All rights reserved.
//

import UIKit

class LoginModel: NSObject {

    var user    :String = "123"
    var password:String = "123"
    var server  :String = "xiaoyu.com"
    var ip      :String = "114.116.42.231"
    var prot    :UInt16 = 5222
    
    init(with _user:String,
         _password:String,
         _server:String = "xiaoyu.com",
         _ip:String = "114.116.42.231",
         _prot:UInt16 = 5222) {
        super.init()
        self.user = _user
        password = _password
        server = _server
        ip  = _ip
        prot = _prot
    }
    
}
