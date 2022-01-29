//
//  GasProvider.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation
import Alamofire

enum GasProviderError: Error {
    case badURL
    case generic(Error?)
}

protocol GasProviderContract {
    func getGasolinerasList(_ completion: @escaping (Result<[ListaEESSPrecio], GasProviderError>) -> ())
}

class NetworkGasListProvider: GasProviderContract {
    func getGasolinerasList(_ completion: @escaping (Result<[ListaEESSPrecio], GasProviderError>) -> ()) {
        
        guard let url = URL(string: "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/") else {
            completion(.failure(.badURL))
            
            return
        }
        
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable { (response: DataResponse<Gasolinera, AFError>) in
            switch response.result {
                
            case .success(let gasolineras): completion(.success(gasolineras.listaEESSPrecio))
            case .failure(let error): completion(.failure(.generic(error)))
                
            }
        }.validate()
        
    }
    
    
    
}
