//
//  ListInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import Foundation
import Alamofire

protocol ListInteractorContract {
    var output: ListInteractorOutputContract? {get set}
    
    func fetchItems()
}

protocol ListInteractorOutputContract {
    func didFetch(gas: [ListaEESSPrecio])
    func fetchDidFail()
}


class ListInteractor: ListInteractorContract {
    var output: ListInteractorOutputContract?
    var gasProvider: GasProviderContract?
    
    func fetchItems() {
        
        gasProvider?.getGasolinerasList({ result in
            switch result {
            case .success(let gasolineras): self.output?.didFetch(gas: gasolineras)
            case .failure: self.output?.fetchDidFail()
            }
        })
        
    }
    
}
