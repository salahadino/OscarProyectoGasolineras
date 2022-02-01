//
//  UserInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 1/2/22.
//

import Foundation


protocol UserInteractorContract {
    
    func saveData(with: UserModel)
    
}

protocol UserInteractorOutputContract {
    
    
}

class UserInteractor: UserInteractorContract {
    
    var userProvider: UserProviderContract?
    
    func saveData(with userModel: UserModel) {
        userProvider?.saveUserToDisk(with: userModel, { result in
            if result {
                print("Datos guardados")
            }
        })
            
    }
    
    
    
}
