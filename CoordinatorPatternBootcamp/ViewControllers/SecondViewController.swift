//
//  SecondViewController.swift
//  CoordinatorPatternBootcamp
//
//  Created by Ponthota, Viswanath Reddy on 08/08/24.
//

import UIKit

class SecondViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    private var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPurple
        // Do any additional setup after loading the view.
        
        backButton = createButton()
        view.addSubview(backButton)
        addConstraints()
    }
    
    //MARK: Private Functions
    private func createButton() -> UIButton  {
        let action = UIAction(title: "Back") { [weak self] action in
            guard let self else { return }
            self.coordinator?.popViewController(
                animated: true,
                useCustomAnimation: true,
                transitionType: .moveIn
            )
        }
        
        let button = UIButton(primaryAction: action)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }
    
    private func addConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
