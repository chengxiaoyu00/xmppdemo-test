//
//  RootTabBarViewController.swift
//  xmppDemo
//
//  Created by chengxiaoyu on 2018/10/19.
//  Copyright © 2018 chengxiaoyu. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = UIColor.lightGray
        } else {
            // Fallback on earlier versions
        }
        tabBar.tintColor = UIColor.orange
        // Do any additional setup after loading the view.
        addChildVC()
    }

}
// MARK:- UITabBarDelegate
extension RootTabBarViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //        super.tabBar(tabBar, didSelect: item)
    }
}
extension RootTabBarViewController:UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
extension RootTabBarViewController {
    private func addChildVC() -> Void {
        if let nav0 = XYRoter.sharedMediator.Roter_GetLoginVC() {
            self.addChild(nav0)
        }
    }
}
// MARK:- statusBar
extension RootTabBarViewController {
    open override var prefersStatusBarHidden: Bool {
        return self.selectedViewController?.prefersStatusBarHidden ?? false
    }
    open  override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.default
    }
    open  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return self.selectedViewController?.preferredStatusBarUpdateAnimation ?? UIStatusBarAnimation.slide
    }
    open override var shouldAutorotate: Bool {
        return self.selectedViewController?.shouldAutorotate ?? false
    }
    // MARK: - about keyboard orientation
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.selectedViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.allButUpsideDown;
    }
    //返回最优先显示的屏幕方向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.selectedViewController?.preferredInterfaceOrientationForPresentation ?? UIInterfaceOrientation.portrait
    }
}
