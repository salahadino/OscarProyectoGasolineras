//
//  UserInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 1/2/22.
//

import Foundation


protocol UserInteractorContract {
    
    var output: UserInteractorOutputContract? {get set}
    
    func saveData(with: UserModel)
    func loadData()
    
}

protocol UserInteractorOutputContract {
    
    func didSave()
    func didLoad(viewModel: UserModel)
}

class UserInteractor: UserInteractorContract {
    
    private var userModel = UserModel()
    
    func loadData() {
        userProvider?.loadUserFromDisk({ user in
            guard let user = user else {return}
            self.userModel = user
            self.output?.didLoad(viewModel: user)
            
        })
    }
    
    var userProvider: UserProviderContract?
    var output: UserInteractorOutputContract?
    
    func saveData(with userModel: UserModel) {
        userProvider?.saveUserToDisk(with: userModel, { result in
            if result {
                print(userModel)
                self.output?.didSave()
            }
        })
            
    }
    
    
}
