//
//  UserBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 30/1/22.
//

import Foundation
import UIKit

class UserBuilder {
    
    func build() -> UIViewController {
        
        let viewController = UserView.createFromStoryboard()
        
        let presenter = UserPresenter()
        
        presenter.view = viewController
        presenter.userProvider = UserProvider()
        viewController.presenter = presenter
        
        return viewController
    }
}
