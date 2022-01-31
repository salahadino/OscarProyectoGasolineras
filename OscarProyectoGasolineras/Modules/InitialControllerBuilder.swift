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
        userViewController.tabBarItem = UITabBarItem.init(title: "Usuario", image: nil, tag: 1)
        
        let navigationController = UINavigationController(rootViewController: listViewController)
        
        navigationController.tabBarItem = UITabBarItem(title: "Gasolineras", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        
        
        
        let tabBarcontroller = UITabBarController()
        
        tabBarcontroller.setViewControllers([navigationController, userViewController], animated: false)
        
        
        return tabBarcontroller
        
        
    }
}
