//
//  UserProvider.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

protocol UserProviderContract {
    
    func saveUserToDisk(with viewModel: UserModel,_ completion: @escaping(Bool) ->())
    func loadUserFromDisk(_ completion: @escaping(UserModel?) ->())
 
}

class UserProvider: UserProviderContract {
    
    let fileManager = FileManager.default
    let fileName = "userData"

    var fileUrl: URL? {
        
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).plist")
        return url
    }
    func loadUserFromDisk(_ completion: @escaping (UserModel?) -> ()) {
        guard let url = fileUrl else {
            completion(nil)
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(nil)
            return
        }
        let user = try? PropertyListDecoder().decode(UserModel.self, from: data)
        completion(user)
    }
    
    func saveUserToDisk(with viewModel: UserModel, _ completion: @escaping (Bool) -> ()) {
        
      
        guard let url = fileUrl else {
            completion(false)
            return
            
        }
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(viewModel)
            try data.write(to: url)
            completion(true)
//            print("user guardado", url)
        } catch {
            
            
        }
    }
    
}
