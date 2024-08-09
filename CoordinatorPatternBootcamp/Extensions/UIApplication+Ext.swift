//
//  UIApplication+Ext.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 09/08/24.
//

import Foundation

import Foundation
import UIKit

extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController? = nil
        if #available(iOS 13, *) {
            for scene in connectedScenes {
                if let windowScene = scene as? UIWindowScene {
                    for window in windowScene.windows {
                        if window.isKeyWindow {
                            topViewController = window.rootViewController
                        }
                    }
                }
            }
        } else {
            topViewController = keyWindow?.rootViewController
        }
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            } else if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            } else if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            } else {
                /// Handle any other third party container in `else if` if required
                break
            }
        }
        return topViewController
    }
    
    func topNavigationController() -> UINavigationController? {
        return topViewController()?.navigationController
    }
}
