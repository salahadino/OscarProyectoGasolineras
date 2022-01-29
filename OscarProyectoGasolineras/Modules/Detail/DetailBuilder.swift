//
//  DetailBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation
import UIKit

class DetailBuilder {
    
//    func build(viewModel: DetailViewModel) -> UIViewController {
//
//        let viewConroller = DetailView.createFromStoryboard()
//        viewConroller.viewModel = viewModel
//        return viewConroller
//
//    }
    
    func build(gasId: String) -> UIViewController {
        let viewController = DetailView.createFromStoryboard()
        viewController.gasID = gasId
        let interactor = DetailInteractor()
     
        let presenter = DetailPresenter()
        presenter.interactor = interactor
        viewController.presenter = presenter
        presenter.view = viewController
        
        interactor.gasProvider = NetworkGasListProvider()
        return viewController
    }
}
