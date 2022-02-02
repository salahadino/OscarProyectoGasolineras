//
//  UserInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 1/2/22.
//

import Foundation


protocol UserInteractorContract: AnyObject {
    
    var output: UserInteractorOutputContract? {get set}
    
    func saveData(with: UserModel)
    func loadData()
    
}

protocol UserInteractorOutputContract: AnyObject {
    
    func didSave()
    func didNotsave()
    func didLoad(viewModel: UserModel)
    func didNotLoad()
}

class UserInteractor: UserInteractorContract {
    
    private var userModel = UserModel()
    
    func loadData() {
        userProvider?.loadUserFromDisk({ result in
            switch result {
            case .success(let user): self.output?.didLoad(viewModel: user ?? UserModel(name: "", address: "", mail: "", phone: "", model: "", fuel: ""))
            case .failure: self.output?.didNotLoad()
            }
           
        })
    }
    
    var userProvider: UserProviderContract?
    weak var output: UserInteractorOutputContract?
    
    func saveData(with userModel: UserModel) {
        userProvider?.saveUserToDisk(with: userModel, { result in
            switch result {
            case .success(true): self.output?.didSave()
            case .failure: self.output?.didNotsave()
            case .success(false):
                self.output?.didNotsave()
            }
        })
            
    }
    
}
