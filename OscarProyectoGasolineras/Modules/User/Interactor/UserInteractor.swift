//
//  UserInteractor.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 1/2/22.
//

import Foundation
import CoreLocation



enum PermissionInteractorStatus {
    case allowed, denied, unknown
}


protocol UserInteractorContract: AnyObject {
    
    var output: UserInteractorOutputContract? {get set}
    
    func saveData(with: UserModel)
    func loadData()
    
    var currentPermission: PermissionInteractorStatus {get}
    func askForPermission()
   
  
}

protocol UserInteractorOutputContract: AnyObject {
    
    func didSave()
    func didNotsave()
    func didLoad(viewModel: UserModel)
    func didNotLoad()
    
    func didUpdatePermission(status: PermissionInteractorStatus)
    
    
 
}

class UserInteractor: NSObject{
   
    var userProvider: UserProviderContract?
    weak var output: UserInteractorOutputContract?
    
    private let locationManager: CLLocationManager
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
   
    private var userModel = UserModel()
    
    private var userLocation: CLLocation?
    
    
}

extension UserInteractor: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        output?.didUpdatePermission(status: currentPermission)
    }
    
}

extension UserInteractor: UserInteractorContract {
    
    func loadData() {
        userProvider?.loadUserFromDisk({ result in
            switch result {
            case .success(let user): self.output?.didLoad(viewModel: user ?? UserModel(name: "", address: "", mail: "", phone: "", model: "", fuel: ""))
            case .failure: self.output?.didNotLoad()
            }
           
        })
    }
    
  
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
    
    func askForPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
       
    }
    var currentPermission: PermissionInteractorStatus {
        switch locationManager.authorizationStatus {
        case .notDetermined: return .unknown
        case .restricted, .denied: return .denied
        case .authorizedAlways, .authorizedWhenInUse: return .allowed
        @unknown default: return .unknown
        }
    }
}
