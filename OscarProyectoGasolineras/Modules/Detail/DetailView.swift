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

class DetailView: UIViewController {

    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var localidad: UILabel!
    @IBOutlet weak var direccion: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var rotulo: UILabel!
    
    static func createFromStoryboard() -> DetailView {
        
        return UIStoryboard(name: "DetailView", bundle: .main).instantiateViewController(withIdentifier: "DetailView") as! DetailView
    }
    
    var viewModel: DetailViewModel?
    var gasID: String?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure(with: viewModel)
        
        rotulo.text = gasID

        // Do any additional setup after loading the view.
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
        logo.image = viewModel.logo

    }
    


}
