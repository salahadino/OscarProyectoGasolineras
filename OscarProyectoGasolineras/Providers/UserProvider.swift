//
//  UserProvider.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

protocol UserProviderContract {
    
    func saveUserToDisk(with viewModel: UserModel,_ completion: @escaping(Bool) ->())
    
    
}

class UserProvider: UserProviderContract {
    func saveUserToDisk(with viewModel: UserModel, _ completion: @escaping (Bool) -> ()) {
        
        let fileManager = FileManager.default
        let fileName = "userData"
        
       
        
        var fileUrl: URL? {
            
            let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).plist")
            return url
        }
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
            print("user guardado", url)
        } catch {
            
            
        }
    }
    
    
    
}
