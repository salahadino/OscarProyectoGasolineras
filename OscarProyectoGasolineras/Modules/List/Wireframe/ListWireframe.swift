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

class ListWireframe: ListWireframeContract {
    var view: UIViewController?
    
    func navigate(to gas: ListaEESSPrecio) {
        
        DispatchQueue.main.async {
            let viewController = DetailBuilder().build(viewModel: DetailViewModel(rotulo: gas.rotulo, precio: gas.precioGLP, localidad: gas.localidad, direccion: gas.dirección, horario: gas.horario, logo: gas.imagen))
            
            self.view?.navigationController?.pushViewController(viewController, animated: true)
          
        }
    }
    
    
    
}
