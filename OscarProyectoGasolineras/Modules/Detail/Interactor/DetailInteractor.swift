//
//  DetailInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation

protocol DetailInteractorContract {
    
    var output: DetailInteractorOutputContract? {get set}
    
    func fetchGasolineras()
    
}

protocol DetailInteractorOutputContract {
    func didFetch(gas: [ListaEESSPrecio])
    func fetchDidFail()
}

class DetailInteractor: DetailInteractorContract {
    var output: DetailInteractorOutputContract?
    var gasProvider: GasProviderContract?
    
    func fetchGasolineras() {
        gasProvider?.getGasolinerasList({ result in
            switch result {
            case .success(let gasolineras): self.output?.didFetch(gas: gasolineras)
            case .failure: self.output?.fetchDidFail()
            }
        })
    }
    
}
