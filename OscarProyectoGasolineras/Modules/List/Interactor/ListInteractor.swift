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
    
    func fetchItems() {
        
        guard let url = URL(string: "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/") else {
            output?.fetchDidFail()
            return
        }
        
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable { (response: DataResponse<Gasolinera, AFError>) in
            switch response.result {
            case .success(let gas): self.output?.didFetch(gas: gas.listaEESSPrecio)
            case .failure: self.output?.fetchDidFail()
            }
        }.validate()
        
        
        
    }
    
    
    
}
