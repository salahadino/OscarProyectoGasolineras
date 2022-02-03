//
//  DetailBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation
import UIKit

class DetailBuilder {
   
    func build(gasId: String) -> UIViewController {
        let viewController = DetailView.createFromStoryboard()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        
        presenter.interactor = interactor
        viewController.presenter = presenter
        presenter.view = viewController
        viewController.gasID = gasId
        interactor.gasProvider = NetworkGasListProvider()
        
        return viewController
    }
}
