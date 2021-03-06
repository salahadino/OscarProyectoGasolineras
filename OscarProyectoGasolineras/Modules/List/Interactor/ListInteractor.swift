//
//  ListInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import Foundation


protocol ListInteractorContract {
    var output: ListInteractorOutputContract? {get set}
    var gasProvider: GasProviderContract? {get set}
    func fetchItems()
}

protocol ListInteractorOutputContract {
    func didFetch(gasolineras: [ListaEESSPrecio])
    func fetchDidFail()
}


class ListInteractor {
    var output: ListInteractorOutputContract?
    var gasProvider: GasProviderContract?
     
}

extension ListInteractor: ListInteractorContract {
    
    func fetchItems() {
        gasProvider?.getGasolinerasList({ result in
            switch result {
            case .success(let gasolineras): self.output?.didFetch(gasolineras: gasolineras)
            case .failure: self.output?.fetchDidFail()
            }
        })
        
    }
}

