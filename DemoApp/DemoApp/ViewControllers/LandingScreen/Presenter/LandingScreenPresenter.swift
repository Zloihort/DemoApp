//
//  LandingScreenPresenter.swift
//  DemoApp
//
//  Created by NarberalGamma on 30.04.2024.
//

import Foundation

protocol LandingScreenPresenterProtocol {
    func fetchData()
    func itemsCount() -> Int
    func item(at index: Int) -> String
}

class LandingScreenPresenter: LandingScreenPresenterProtocol {
    private var model = LandingScreenModel()
    var view: LandingScreenViewProtocol? = nil
    
    init(model: LandingScreenModel) {
        self.model = model
    }
    
    func fetchData() {
       model.getNewData()
       view?.reloadData()
    }
    
    func itemsCount() -> Int {
        model.elements.count
    }
    
    func item(at index: Int) -> String {
        // TO DO: - to check for index safety
        model.elements[index]
    }
}
