//
//  UserPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation
import CoreLocation


protocol UserPresenterContract: AnyObject {
    
    var view: UserViewContract? {get set}
    var interactor: UserInteractorContract? {get set}
    
    func didUpdateName(_ name: String?)
    func didUpdateAddress(_ address: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)
    func didUpdateModel(_ model: String?)
    func didUpdateFuel(_ fuel: String?)
    
    func didSend()
    
    func viewDidLoad()
    
    func didPressPermissionsButton()
 
}


class UserPresenter {
  
    var interactor: UserInteractorContract?
    weak var view: UserViewContract?
    
    private var userModel = UserModel() 
    
}

extension UserPresenter: UserInteractorOutputContract {
 
   
    func didSave() {
        view?.showSaveSuccess()
    }
    
    func didNotsave() {
        view?.showSaveError()
    }
    
    func didLoad(viewModel: UserModel) {
        view?.configure(with: UserViewModel(name: viewModel.name, address: viewModel.address, mail: viewModel.mail, phone: viewModel.phone, model: viewModel.model, fuel: viewModel.fuel))
    }
    func didNotLoad() {
        view?.showLoadError()
    }
    
    func didUpdatePermission(status: PermissionInteractorStatus) {
        switch status {
        case .allowed: view?.setAllowed()
        case .denied, .unknown: view?.setNotAllowed()
    
        }
    }

}
extension UserPresenter: UserPresenterContract {
 
    func didUpdateName(_ name: String?) {
        userModel.name = name
        view?.didValidateName(userModel.isValidName)
    }
    
    func didUpdateAddress(_ address: String?) {
        userModel.address = address
        view?.didValidateAddress(userModel.isValidAdress)
    }
    
    func didUpdatePhone(_ phone: String?) {
        userModel.phone = phone
        view?.didValidatePhone(userModel.isValidPhone)
    }
    
    func didUpdateMail(_ mail: String?) {
        userModel.mail = mail
        view?.didValidateMail(userModel.isValidMail)
    }
    
    func didUpdateModel(_ model: String?) {
        userModel.model = model
        view?.didValidateModel(userModel.isValidModel)
    }
    
    func didUpdateFuel(_ fuel: String?) {
        userModel.fuel = fuel
        view?.didValidateFuel(userModel.isValidFuel)
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.loadData()
     
        guard let status = interactor?.currentPermission else {return}
        didUpdatePermission(status: status)
     
    }
    
    func didSend() {
        guard userModel.isValid else {
            view?.showSendError()
            return
        }
        interactor?.saveData(with: userModel)
    }
    
    
    func didPressPermissionsButton() {
        guard let status = interactor?.currentPermission else {return}
        switch status {
        case .allowed: break
            
        case .denied: view?.openSettings()
        case .unknown: interactor?.askForPermission()
            
        }
    }

}


