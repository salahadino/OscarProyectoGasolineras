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
        let interactor = UserInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.userProvider = UserProvider()
        viewController.presenter = presenter
        
        return viewController
    }
}
