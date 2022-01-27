//
//  InitialControllerBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 27/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    
    func build() -> UIViewController {
        
        let listViewController = ListBuilder().build()
        
        let navigationController = UINavigationController(rootViewController: listViewController)
        
        navigationController.tabBarItem = UITabBarItem(title: "Gasolineras", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        
        let tabBarcontroller = UITabBarController()
        
        tabBarcontroller.setViewControllers([navigationController], animated: false)
        
        
        return tabBarcontroller
        
        
    }
}
