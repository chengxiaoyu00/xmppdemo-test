//
//  Target_LoginVC.swift
//  xmppDemo
//
//  Created by chengxiaoyu on 2018/10/19.
//  Copyright © 2018 chengxiaoyu. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
@objc class Target_LoginVC:NSObject {
    @objc func Action_GetLoginVC(params: [String: AnyObject])-> LoginViewController? {
		let loginVC = LoginViewController()
        loginVC.tabBarItem.image = #imageLiteral(resourceName: "btn_home_normal")
		loginVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "btn_home_selected")
		loginVC.tabBarItem.title = "登录"
		loginVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        return loginVC
    }
}
