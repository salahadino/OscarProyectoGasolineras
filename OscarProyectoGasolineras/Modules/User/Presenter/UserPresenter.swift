//
//  UserPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

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
}


class UserPresenter: UserPresenterContract, UserInteractorOutputContract {
   
    var interactor: UserInteractorContract?
    weak var view: UserViewContract?
    
    private var userModel = UserModel() 
    
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
    }
    
    func didSend() {
        guard userModel.isValid else {
            view?.showSendError()
            return
        }
        interactor?.saveData(with: userModel)
    }
    
    func didSave() {
        view?.showSaveSuccess()
    }
    
    func didNotsave() {
        print("Error al guardar los datos")
    }
    
    func didLoad(viewModel: UserModel) {
        view?.configure(with: UserViewModel(name: viewModel.name, address: viewModel.address, mail: viewModel.mail, phone: viewModel.phone, model: viewModel.model, fuel: viewModel.fuel))
    }
    func didNotLoad() {
        print("No se cargaron los datos")
    }
    
}


