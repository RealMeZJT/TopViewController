//
//  TopViewController.swift
//  TopViewController
//
//  Created by ZhouJiatao on 2018.02.19.
//  Copyright © 2018 ZJT. All rights reserved.
//

import UIKit

public class TopViewController {
    
    public static func topViewContoller() -> UIViewController? {
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        return topViewController(root: root)
    }
    
    public static func topViewController(root: UIViewController) -> UIViewController {
       
        var top: UIViewController = root


        while true {
            
            if let child = top.childViewControllers.last {
                top = child
                continue
            }
            
            if let nav = top as? UINavigationController {
                if let vc = nav.viewControllers.last {
                    top = vc
                    continue
                }
            }
            
            if let tab = top as? UITabBarController {
                if let vc = tab.selectedViewController {
                    top = vc
                    continue
                }
            }
            
            if let presented = top.presentedViewController {
                top = presented
                continue
            }
            
           break
        }

       return top
    }
}
