//
//  MainCordinator.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 08/08/24.
//

import UIKit

class MainCoordinator: ParentCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = true) {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationController.pushViewController(firstViewController, animated: animated)
        
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter {$0 !== childCoordinator}
    }
}

extension MainCoordinator {
    func goToSecondViewController(animated: Bool = true) {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        navigationController.pushViewController(secondViewController, animated: animated)
    }
    
    func startHomeJourney() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
        addChild(homeCoordinator)
    }
}
