//
//  ChildCoordinator.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 09/08/24.
//

import UIKit


/// All Child coordinators should conform to this protocol
protocol ChildCoordinator: Coordinator {
    /**
     The body of this function should call `childDidFinish(_ child:)` on the parent coordinator to remove the child from parent's `childCoordinators`.
     */
    func coordinatorDidFinish()
    
    /// A reference to the view controller used in the coordinator.
    var viewControllerRef: UIViewController? {get set}
}
