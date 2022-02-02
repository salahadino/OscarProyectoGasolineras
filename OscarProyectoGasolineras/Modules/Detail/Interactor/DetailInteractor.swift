//
//  DetailInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation

protocol DetailInteractorContract: AnyObject {
    
    var output: DetailInteractorOutputContract? {get set}
    
    func fetchGasolineras()
    
}

protocol DetailInteractorOutputContract: AnyObject {
    func didFetch(gas: [ListaEESSPrecio])
    func fetchDidFail()
}

class DetailInteractor: DetailInteractorContract {
    weak var output: DetailInteractorOutputContract?
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
