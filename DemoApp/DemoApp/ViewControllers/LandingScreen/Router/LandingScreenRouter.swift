//
//  LandingScreenRouter.swift
//  DemoApp
//
//  Created by NarberalGamma on 30.04.2024.
//

import UIKit

class LandingScreenRouter {
    private var navigationController: UINavigationController? = nil
    
    public func start(from: UINavigationController) {
        self.navigationController = from
        let presenter = LandingScreenPresenter(model: LandingScreenModel())
        let viewController = LandingScreen()
        viewController.presenter = presenter
        presenter.view = viewController

        navigationController?.pushViewController(viewController, animated: false)
    }
}
