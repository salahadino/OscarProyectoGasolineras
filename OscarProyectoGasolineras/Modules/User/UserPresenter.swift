//
//  UserPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

protocol UserPresenterContract {
    
    var view: UserViewContract? {get set}
    var interactor: UserInteractorContract? {get set}
    
    func didUpdateName(_ name: String?)
    func didUpdateAddress(_ address: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)
    func didUpdateModel(_ model: String?)
    func didUpdateFuel(_ fuel: String?)
    
    func didSend()
}


class UserPresenter: UserPresenterContract {
    //A interactor
    private let fileManager: FileManager
    private let fileName: String
    
    init(fileManager: FileManager = FileManager.default, fileName: String = "userData") {
        
        self.fileName = fileName
        self.fileManager = fileManager
    }
    
    private var fileUrl: URL? {
        
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).plist")
        return url
    }
    
    
   
    //------------------------------
    
    var interactor: UserInteractorContract?
    var view: UserViewContract?
    
    private var userModel = UserModel() {
        
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
    
    func didSend() {
        guard userModel.isValid else {
            view?.showSendError()
            return
        }
        
        interactor?.saveData(with: userModel)
    
    }
    
    
}

//A interactor
private extension UserPresenter {
    func saveUser(_ user: UserModel) {
        
        guard let url = fileUrl else {return}
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(user)
            try data.write(to: url)
        } catch {
            
            
        }
        
    }
    
    func loadUser(_ completion: @escaping (UserModel?) -> ()) {
        DispatchQueue.global().async {
            guard let url = self.fileUrl else {
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
      
    }
}
