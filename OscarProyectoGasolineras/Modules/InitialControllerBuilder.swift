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
        let userViewController = UserBuilder().build()
        
        
        let navigationController = UINavigationController(rootViewController: listViewController)
        let userNavigationController = UINavigationController(rootViewController: userViewController)
        
        navigationController.tabBarItem = UITabBarItem(title: "Gasolineras", image: UIImage.init(systemName: "list.bullet"), tag: 1)
        userNavigationController.tabBarItem = UITabBarItem(title: "Usuario", image: UIImage.init(systemName: "person"), tag: 0)
        
        
        let tabBarcontroller = UITabBarController()
        
        tabBarcontroller.setViewControllers([userNavigationController, navigationController], animated: false)
        
        
        return tabBarcontroller
        
        
    }
}
