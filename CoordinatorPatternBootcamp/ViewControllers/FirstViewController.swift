//
//  FirstViewController.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 08/08/24.
//

import UIKit

final class FirstViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    private var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        // Do any additional setup after loading the view.
        nextButton = createNextButton()
        view.addSubview(nextButton)
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: Private Functions
    private func createNextButton() -> UIButton  {
        let action = UIAction(title: "Next") { [weak coordinator] action in
            guard let coordinator else { return }
            coordinator.goToSecondViewController()
        }
        
        let button = UIButton(primaryAction: action)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }
    
    private func addConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
