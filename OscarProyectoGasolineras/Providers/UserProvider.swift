//
//  UserProvider.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

enum UserProviderError: Error {
    case badURL
    case generic(Error?)
    
}

protocol UserProviderContract {
    func loadUserFromDisk(_ completion: @escaping (Result<UserModel?, UserProviderError>) ->())
    func saveUserToDisk(with viewModel: UserModel,_ completion: @escaping (Result<Bool, UserProviderError>) -> ())
}

class UserProvider: UserProviderContract {
    let fileManager = FileManager.default
    let fileName = "userData"

    var fileUrl: URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).plist")
        return url
    }
    
    func loadUserFromDisk(_ completion: @escaping (Result<UserModel?, UserProviderError>) -> ()) {
        guard let url = fileUrl else {
            completion(.failure(.badURL))
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(.success(nil))
            return
        }
        let user = try? PropertyListDecoder().decode(UserModel.self, from: data)
        completion(.success(user))
    }
 
    
    func saveUserToDisk(with viewModel: UserModel, _ completion: @escaping (Result<Bool, UserProviderError>) -> ()) {
        guard let url = fileUrl else {
            completion(.failure(.badURL))
            completion(.success(false))
            return
        }
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(viewModel)
            try data.write(to: url)
            completion(.success(true))
            
        } catch {
            
            completion(.failure(.generic(error)))
            completion(.success(false))
        }
      
  
    }
    

    
}
