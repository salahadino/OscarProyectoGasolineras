//
//  DetailBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation
import UIKit

class DetailBuilder {
    
    func build(viewModel: DetailViewModel) -> UIViewController {
        
        let viewConroller = DetailView.createFromStoryboard()
        viewConroller.viewModel = viewModel
        return viewConroller
         
    }
}
