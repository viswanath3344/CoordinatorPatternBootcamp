//
//  CoordinatorProtocol.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 08/08/24.
//

import UIKit

//MARK: Ref: https://medium.com/@maysam.shahsavari/a-comprehensive-guide-to-coordinator-pattern-in-swift-7e7647ecc525

protocol Coordinator: AnyObject {
    /// The navigation controller for the coordinator
    var navigationController: UINavigationController { get set }
    
    
    /// The Coordinator takes control and activates itself.
    /// - Parameter animated: Set the value to true to animate the transition. Pass false if you are setting up a navigation controller before its view is displayed.
    func start(animated: Bool)
    
    
    /// Pops out the active View Controller from the navigation stack.
    /// - Parameters:
    ///  - animated: Set this value to true to animate the transition.
    func popViewController(animated: Bool, useCustomAnimation: Bool, transitionType: CATransitionType)
}

extension Coordinator {
    /**
     Pops the top view controller from the navigation stack and updates the display.
     
     - Parameters:
     - animated: Set this value to true to animate the transition.
     - useCustomAnimation: Set to true if you want a transition from top to bottom.
     */
    func popViewController(animated: Bool, useCustomAnimation: Bool = false, transitionType: CATransitionType = .push) {
        if useCustomAnimation {
            navigationController.customPopViewController(transitionType: transitionType)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    /**
     Pops view controllers until the specified view controller is at the top of the navigation stack.
     - Parameters:
     - ofClass: The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
     - animated: Set this value to true to animate the transition.
     */
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        navigationController.popToViewController(ofClass: ofClass, animated: animated)
    }
    
    /**
     Pops view controllers until the specified view controller is at the top of the navigation stack.
     
     - Parameters:
     -  viewController: The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
     - animated: Set the value to true to animate the transition.
     - useCustomAnimation: Set to true if you want a transition from top to the bottom.
     */
    func popViewController(to viewController: UIViewController, animated: Bool, useCustomAnimation: Bool, transitionType: CATransitionType = .push) {
        if useCustomAnimation {
            navigationController.customPopToViewController(viewController: viewController, transitionType: transitionType)
        } else {
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
}
