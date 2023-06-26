//
//  FilmCoordinators.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation
import UIKit
protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
}
class FilmCoordinators: Coordinator {
    var navigationController: UINavigationController
    var factory: FilmFactory
    
    init(navigationController: UINavigationController, factory: FilmFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    
}
