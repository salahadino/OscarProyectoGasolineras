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
    
    func didSearch(with searchText: String)
   
}

class ListPresenter: ListPresenterContract {
   
    weak var view: ListViewContract?
    var interactor: ListInteractorContract?
    var wireframe: ListWireframeContract?
    
    private var filteredData: [ListaEESSPrecio]!
    
    private var gasolineras = [ListaEESSPrecio]() {
        
        didSet {
            filteredData = gasolineras
            view?.reloadData()
        }
    }
    
    func didSearch(with searchText: String) {
        
        filteredData = []
        print("Estoy buscando", searchText)
        if searchText == "" {
            filteredData = gasolineras
        } else {
            
            filteredData = gasolineras.filter { (gasolinera: ListaEESSPrecio) -> Bool in
                return gasolinera.localidad?.lowercased().contains(searchText.lowercased()) ?? false
            }
            
        }
       
        
        view?.reloadData()
    }
   
    
    var numItems: Int {
        //return gasolineras.count
        
    
        if filteredData == nil {
            return gasolineras.count
        } else {
            return filteredData.count
        }
        
        
        
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModel {
        //let gasolinera = gasolineras[indexPath.row]
        let gasolinera = filteredData[indexPath.row]
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
        
    }
    
}
