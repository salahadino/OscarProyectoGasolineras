//
//  User.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 31/1/22.
//

import Foundation

struct UserModel: Codable {
    
    var name: String?
    var address: String?
    var mail: String?
    var phone: String?
    var model: String?
    var fuel: String?
    
    var isValidName: Bool {
        guard let name = name else {return false}
        return !name.isEmpty
    }
    var isValidAdress: Bool {
        guard let address = address else {return false}
        return !address.isEmpty
    }
    var isValidMail: Bool {
        guard let mail = mail else {return false}
        return !mail.isEmpty
    }
    var isValidPhone: Bool {
        guard let phone = phone else {return false}
        return !phone.isEmpty
    }
    var isValidModel: Bool {
        guard let model = model else {return false}
        return !model.isEmpty
    }
    var isValidFuel: Bool {
        guard let fuel = fuel else {return false}
        return !fuel.isEmpty
        
    }
    
    var isValid: Bool {
        return isValidName && isValidAdress && isValidMail && isValidPhone && isValidModel && isValidFuel
    }
    
    
}

