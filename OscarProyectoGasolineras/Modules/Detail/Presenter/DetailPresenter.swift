//
//  DetailPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 29/1/22.
//

import Foundation

protocol DetailPresenterContract: AnyObject {
    
    var view: DetailViewContract? {get set}
    var interactor: DetailInteractorContract? {get set}
    var idGas: String? {get set}
    var gasolineraABuscar: ListaEESSPrecio? {get set}
    
    func viewModel() -> DetailViewModel
    func viewDidLoad()
    
}

class DetailPresenter {
    var interactor: DetailInteractorContract?
    weak var view: DetailViewContract?
    var gasolineraABuscar: ListaEESSPrecio? {
        didSet {
            view?.reloadData()
        }
    }
    
    var idGas: String?
    
    private var gasolineras = [ListaEESSPrecio]()
    
  
}

extension DetailPresenter: DetailPresenterContract {
    
    func viewModel() -> DetailViewModel {
        return DetailViewModel(rotulo: gasolineraABuscar?.rotulo, precio: gasolineraABuscar?.precioGLP, localidad: gasolineraABuscar?.localidad, direccion: gasolineraABuscar?.direccion, horario: gasolineraABuscar?.horario, logo: gasolineraABuscar?.imagen)
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchGasolineras()
    }
}

extension DetailPresenter: DetailInteractorOutputContract {
    func didFetch(gas: [ListaEESSPrecio]) {
        self.gasolineras = gas
        self.gasolineraABuscar = gas.first {$0.ideess == idGas}
        view?.stopIndicator()
    }
    
    func fetchDidFail() {
        view?.showLoadError()
        
    }
    
}
