//
//  ListWireframe.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation
import UIKit

protocol ListWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to gas: ListaEESSPrecio)
}

class ListWireframe {
    var view: UIViewController?
    
}

extension ListWireframe: ListWireframeContract {
    func navigate(to gas: ListaEESSPrecio) {
        DispatchQueue.main.async {
            let viewController = DetailBuilder().build(gasId: gas.ideess ?? "")
            self.view?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
