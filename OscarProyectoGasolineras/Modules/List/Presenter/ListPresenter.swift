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
    
    private var gas = [ListaEESSPrecio]() {
        
        didSet {
            view?.reloadData()
        }
    }
    
    var numItems: Int {
        return gas.count
        
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModel {
        let item = gas[indexPath.row]
        return ListCellViewModel(logo: item.imagen, rotulo: item.rotulo ?? "", localidad: item.localidad, precio: item.precioGLP)
       
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let gasolinera = gas[indexPath.row]
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
    
    func didFetch(gas: [ListaEESSPrecio]) {
        
        self.gas = gas
        self.gas.removeAll() {$0.precioGLP == ""}
        
    }
    
}
