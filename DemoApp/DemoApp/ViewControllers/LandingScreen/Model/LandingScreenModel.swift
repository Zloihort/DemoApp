//
//  LandingScreenModel.swift
//  DemoApp
//
//  Created by NarberalGamma on 30.04.2024.
//

import Foundation

struct LandingScreenModel {
    var elements = ["First", "Second", "Third"]
    
    mutating func getNewData() {
        elements.shuffle()
    }
}
