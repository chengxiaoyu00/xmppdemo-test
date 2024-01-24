//
//  xmppManager.swift
//  xmppDemo
//
//  Created by chengxiaoyu on 2018/10/22.
//  Copyright © 2018 chengxiaoyu. All rights reserved.
//

import UIKit
import XMPPFramework

enum LoginErrorCode:Int {
    case success = 0
    case userNameError = 1
    case passwordError = 2
    case serverError = 3
    case netError = 4
}

class xmppManager: NSObject {

    typealias loginCallBack = (_ code:LoginErrorCode)->()
    
    static let shared:xmppManager = {
        let instance = xmppManager.init()
        return instance
    }()
    /// stream流模块
    var xmppStream: XMPPStream?
    /// 好友模块
    var xmppRoster: XMPPRoster? = {
        guard let storage = XMPPRosterMemoryStorage.init() else { return  }
        let roster = XMPPRoster(rosterStorage: storage, dispatchQueue: self.queue)
        return roster
    }()
    /// 这个queue 在async 时候会创建多个thred
    let queue: DispatchQueue = DispatchQueue(label: "com.xiaoyu.queue",qos:.utility ,attributes: .concurrent)
    private var password :String?
    private var user     :String?
    private var loginHandle:loginCallBack?
    
    private override init () {
        super.init()
        self.xmppStream = XMPPStream.init()
    }
    /// 配置
    ///
    /// - Parameters:
    ///   - user: 用户号码
    ///   - domain: 域名 （xiaoyu.com）
    ///   - rouser: 资源描述（iphone）
    ///   - server: 服务器地址（114.116.42.231）
   func config(user:String,domain:String,rouser:String?,server:String,password:String) {
    
        guard let xmppStream = self.xmppStream else { return  }
        xmppStream.hostName = server
        xmppStream.myJID = XMPPJID(user: user, domain: domain, resource: rouser)
        if let roster = xmppRoster {
            roster.addDelegate(self, delegateQueue: queue)
            xmppStream.register(roster)
        }
        xmppStream.addDelegate(self, delegateQueue: queue)
//        xmppStream.accessibilityActivate()
        xmppStream.hostPort = 5222
        self.password = password
    
    }
    func login(callback:@escaping loginCallBack) -> Void {
        loginHandle = callback
        guard let xmppStream = self.xmppStream else { return  }
        if !xmppStream.isConnected {
            
            do {
                _ =  try xmppStream.connect(withTimeout: -1)
                
            } catch let error {
                debugPrint(error)
                callback(LoginErrorCode.netError)
                loginHandle = nil
            }
           
        }
        
        
    }
    
}
extension xmppManager:XMPPStreamDelegate {
    
    func xmppStreamWillConnect(_ sender: XMPPStream) {
        
    }
    
    func xmppStream(_ sender: XMPPStream, socketDidConnect socket: GCDAsyncSocket) {
        
    }
    
    func xmppStreamDidConnect(_ sender: XMPPStream) {
        if let pd = password {
            do {
                let _ = try sender.authenticate(withPassword: pd)
            } catch let error as NSError {
                debugPrint(error)
                if let callback = loginHandle {
                    callback(LoginErrorCode.netError)
                }
                loginHandle = nil
            }
           
        }
    }
    func xmppStreamDidRegister(_ sender: XMPPStream) {
        
    }
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        if let callback = loginHandle {
            callback(LoginErrorCode.success)
        }
        loginHandle = nil
    }
    func xmppStreamConnectDidTimeout(_ sender: XMPPStream) {
        
    }
    func xmppStreamDidStartNegotiation(_ sender: XMPPStream) {
        
    }
    // MARK: 消息模块回掉 message
    func xmppStream(_ sender: XMPPStream, didSend message: XMPPMessage) {
        
    }
    func xmppStream(_ sender: XMPPStream, didReceive message: XMPPMessage) {
        
    }
    // MARK: 这里可以对message 进行校验修改
    func xmppStream(_ sender: XMPPStream, willSend message: XMPPMessage) -> XMPPMessage? {
        return message
    }
    func xmppStream(_ sender: XMPPStream, willReceive message: XMPPMessage) -> XMPPMessage? {
        return message
    }
    
}
extension xmppManager:XMPPRosterDelegate {
    func xmppRosterDidEndPopulating(_ sender: XMPPRoster) {
        
    }
    func xmppRoster(_ sender: XMPPRoster, didReceiveRosterPush iq: XMPPIQ) {
        
    }
    func xmppRoster(_ sender: XMPPRoster, didReceiveRosterItem item: DDXMLElement) {
        
    }
    func xmppRosterDidBeginPopulating(_ sender: XMPPRoster, withVersion version: String) {
        
    }
    func xmppRoster(_ sender: XMPPRoster, didReceivePresenceSubscriptionRequest presence: XMPPPresence) {
        
    }
}
