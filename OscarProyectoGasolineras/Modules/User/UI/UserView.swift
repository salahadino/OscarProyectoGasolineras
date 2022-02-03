//
//  UserView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 30/1/22.
//

import UIKit

struct UserViewModel {
    let name: String?
    let address: String?
    let mail: String?
    let phone: String?
    let model: String?
    let fuel: String?
}

protocol UserViewContract: UIViewController {
    
    var presenter: UserPresenterContract? {get set}
    
    func configure(with viewModel: UserViewModel)
    
    func didValidateName(_ valid: Bool)
    func didValidateAddress(_ valid: Bool)
    func didValidateMail(_ valid: Bool)
    func didValidatePhone(_ valid: Bool)
    func didValidateModel(_ valid: Bool)
    func didValidateFuel(_ valid: Bool)
    
    func showSendError()
    func showSaveSuccess()
    func showSaveError()
    func showLoadError()
  
}

class UserView: UIViewController, UserViewContract, UITextFieldDelegate {
 
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.setTitle(NSLocalizedString("user_form_send_button", comment: ""), for: .normal)
        }
    }
    
    @IBOutlet weak var fuelLabel: UILabel! {
        didSet {
            fuelLabel.text = NSLocalizedString("user_form_car_fuel_type", comment: "")
        }
    }
    @IBOutlet weak var modelLabel: UILabel! {
        didSet {
            modelLabel.text = NSLocalizedString("user_form_car_model", comment: "")
        }
    }
    @IBOutlet weak var carTitleLabel: UILabel! {
        didSet {
            carTitleLabel.text = NSLocalizedString("user_form_car_data", comment: "")
        }
    }
    
    @IBOutlet weak var phoneLabel: UILabel! {
        didSet {
            phoneLabel.text = NSLocalizedString("user_form_phone_label", comment: "")
        }
    }
    @IBOutlet weak var mailLabel: UILabel! {
        didSet {
            mailLabel.text = NSLocalizedString("user_form_mail_label", comment: "")
        }
    }
    @IBOutlet weak var addressLabel: UILabel! {
        didSet {
            addressLabel.text = NSLocalizedString("user_form_address_label", comment: "")
        }
        
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = NSLocalizedString("user_form_full_name_label", comment: "")
        }
    }
    @IBOutlet weak var userTitleLabel: UILabel! {
        didSet {
            userTitleLabel.text = NSLocalizedString("user_form_user_title", comment: "")
        }
    }
    
    @IBOutlet weak var inputFuelType: UITextField!
    @IBOutlet weak var inputModel: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    @IBOutlet weak var inputMail: UITextField!
    @IBOutlet weak var inputAddress: UITextField!
    @IBOutlet weak var inputName: UITextField!
    
    @IBAction func scrollTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    var presenter: UserPresenterContract?
    
    @IBAction func sendAction(_ sender: Any) {
        presenter?.didSend()
        
    }
    static func createFromStoryboard() -> UserView {
        
        return UIStoryboard(name: "UserView", bundle: .main).instantiateViewController(withIdentifier: "UserView") as! UserView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [inputMail, inputName, inputModel, inputPhone, inputAddress, inputFuelType].forEach { inputText in
            inputText?.delegate = self
        }
        
        presenter?.viewDidLoad()
  
    }
    
    func configure(with viewModel: UserViewModel) {
        
        DispatchQueue.main.async {
            self.inputName.text = viewModel.name
            self.inputAddress.text = viewModel.address
            self.inputMail.text = viewModel.mail
            self.inputPhone.text = viewModel.phone
            self.inputModel.text = viewModel.model
            self.inputFuelType.text = viewModel.fuel
        }
       
    }
    
    func didValidateName(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputName.layer.borderWidth = 0
            } else {
                self.inputName.layer.borderWidth = 1
                self.inputName.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func didValidateAddress(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputAddress.layer.borderWidth = 0
            } else {
                self.inputAddress.layer.borderWidth = 1
                self.inputAddress.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func didValidateMail(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputMail.layer.borderWidth = 0
            } else {
                self.inputMail.layer.borderWidth = 1
                self.inputMail.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func didValidatePhone(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputPhone.layer.borderWidth = 0
            } else {
                self.inputPhone.layer.borderWidth = 1
                self.inputPhone.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func didValidateModel(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputModel.layer.borderWidth = 0
            } else {
                self.inputModel.layer.borderWidth = 1
                self.inputModel.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func didValidateFuel(_ valid: Bool) {
        DispatchQueue.main.async {
            if valid {
                self.inputFuelType.layer.borderWidth = 0
            } else {
                self.inputFuelType.layer.borderWidth = 1
                self.inputFuelType.layer.borderColor = UIColor.red.cgColor
            }
        }
        
    }
    
    func showSendError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_error", comment: ""), message: NSLocalizedString("user_form_alert_complete", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showSaveSuccess() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_success", comment: ""), message: NSLocalizedString("user_form_alert_saved", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showSaveError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_error", comment: ""), message: NSLocalizedString("user_form_alert_not_saved", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
    func showLoadError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_error", comment: ""), message: NSLocalizedString("user_form_alert_not_loaded", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
  
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


    
   

