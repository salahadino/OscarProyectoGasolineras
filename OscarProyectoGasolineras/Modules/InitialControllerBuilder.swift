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
        
        
        return listViewController
        
        
    }
}
