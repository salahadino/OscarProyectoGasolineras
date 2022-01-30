//
//  ListPresenter.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import Foundation

protocol ListPresenterContract: AnyObject {
    
    var view: ListViewContract? {set get}
    var interactor: ListInteractorContract? {set get}
    var wireframe: ListWireframeContract? {set get}
    var numItems: Int {get}
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModel
    func didSelectItem(at indexPath: IndexPath)
    func viewDidLoad()
   
}

class ListPresenter: ListPresenterContract {
   
    var view: ListViewContract?
    var interactor: ListInteractorContract?
    var wireframe: ListWireframeContract?
    
    private var gasolineras = [ListaEESSPrecio]() {
        
        didSet {
            view?.reloadData()
        }
    }
    
    var numItems: Int {
        return gasolineras.count
        
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModel {
        let gasolinera = gasolineras[indexPath.row]
        return ListCellViewModel(logo: gasolinera.imagen, rotulo: gasolinera.rotulo ?? "", localidad: gasolinera.localidad, precio: gasolinera.precioGLP)
       
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let gasolinera = gasolineras[indexPath.row]
        wireframe?.navigate(to: gasolinera)
        
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
        
    }

}

extension ListPresenter: ListInteractorOutputContract {
    func fetchDidFail() {
        print("Error")
    }
    
    func didFetch(gasolineras: [ListaEESSPrecio]) {
        
        self.gasolineras = gasolineras
        self.gasolineras.removeAll() {$0.precioGLP == ""}
        
    }
    
}
