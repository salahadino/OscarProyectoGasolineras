//
//  UserView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 30/1/22.
//

import UIKit

protocol UserViewContract: UIViewController {
    
    var presenter: UserPresenterContract? {get set}
    
    
}

class UserView: UIViewController, UserViewContract {
    
    @IBOutlet weak var inputFuelType: UITextField!
    @IBOutlet weak var inputModel: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    @IBOutlet weak var inputMail: UITextField!
    @IBOutlet weak var inputAddress: UITextField!
    @IBOutlet weak var inputName: UITextField!
    
    var presenter: UserPresenterContract?
    
    static func createFromStoryboard() -> UserView {
        
        return UIStoryboard(name: "UserView", bundle: .main).instantiateViewController(withIdentifier: "UserView") as! UserView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [inputMail, inputName, inputModel, inputPhone, inputAddress, inputFuelType].forEach { input in
            input?.delegate = self
        }

        
    }
    

}

extension UserView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case inputName: presenter?.didUpdateName(textField.text)
        case inputAddress: presenter?.didUpdateAddress(textField.text)
        case inputMail: presenter?.didUpdateMail(textField.text)
        case inputPhone: presenter?.didUpdatePhone(textField.text)
        case inputModel: presenter?.didUpdateModel(textField.text)
        case inputFuelType: presenter?.didUpdateFuel(textField.text)
        default: break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case inputName: inputAddress.becomeFirstResponder()
        case inputAddress: inputMail.becomeFirstResponder()
        case inputMail: inputPhone.becomeFirstResponder()
        case inputPhone: inputModel.becomeFirstResponder()
        case inputModel: inputFuelType.becomeFirstResponder()
        case inputFuelType: textField.resignFirstResponder()
        default: break
        }
        
        return true
    }
}
