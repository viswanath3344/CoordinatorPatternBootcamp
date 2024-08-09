//
//  HomeCoordinator.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 08/08/24.
//

import UIKit

class HomeCoordinator: ParentCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = true) {
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: animated)
    }
}
