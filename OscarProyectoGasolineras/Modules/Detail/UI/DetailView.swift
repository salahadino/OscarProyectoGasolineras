//
//  DetailView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import UIKit



struct DetailViewModel {
    let rotulo: String?
    let precio: String?
    let localidad: String?
    let direccion: String?
    let horario: String?
    let logo: UIImage?
}

protocol DetailViewContract: AnyObject {
    var presenter: DetailPresenterContract? {get set}
    func reloadData()
    
}

class DetailView: UIViewController, DetailViewContract {
   
    var presenter: DetailPresenterContract?
    
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var localidad: UILabel!
    @IBOutlet weak var direccion: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var rotulo: UILabel!
    
    static func createFromStoryboard() -> DetailView {
        
        return UIStoryboard(name: "DetailView", bundle: .main).instantiateViewController(withIdentifier: "DetailView") as! DetailView
    }
    
    var gasID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.idGas = gasID
        presenter?.viewDidLoad()

    }
    
    func reloadData() {
  
        configure(with: presenter?.viewModel())

    }
    
    func configure(with viewModel: DetailViewModel?) {
        
        guard let viewModel = viewModel else {
            return
        }
        precio.text = viewModel.precio
        localidad.text = viewModel.localidad
        direccion.text = viewModel.direccion
        horario.text = viewModel.horario
        rotulo.text = viewModel.rotulo
        if viewModel.logo != nil {
            logo.image = viewModel.logo
        } else {
            logo.image = UIImage(named: "nologo")
        }
        

    }
    

}
