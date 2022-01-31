//
//  UserPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

protocol UserPresenterContract {
    
    var view: UserViewContract? {get set}
    
    func didUpdateName(_ name: String?)
    func didUpdateAddress(_ address: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)
    func didUpdateModel(_ model: String?)
    func didUpdateFuel(_ fuel: String?)
}


class UserPresenter: UserPresenterContract {
    var view: UserViewContract?
    
    private var userModel = UserModel(name: nil, address: nil, mail: nil, phone: nil, model: nil, fuel: nil) {
        
        didSet {
            
            print(userModel)
        }
    }
    
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
    
    
    
}
