//
//  ListBuilder.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 27/1/22.
//

import Foundation
import UIKit

class ListBuilder {
    
    func build() -> UIViewController {
        
        let viewController = ListView.createFromStoryboard()
        
        return viewController
        
        
    }
}
