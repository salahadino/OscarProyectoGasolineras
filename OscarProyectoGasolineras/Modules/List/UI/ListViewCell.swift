//
//  ListViewCell.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import UIKit

struct ListCellViewModel {
    
    let logo: UIImage?
    let rotulo: String
    let localidad: String?
    let precio: String?
}

class ListViewCell: UITableViewCell {

    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var localidad: UILabel!
    @IBOutlet weak var rotulo: UILabel!
    @IBOutlet weak var logo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func configure(viewModel: ListCellViewModel) {
        precio.text = viewModel.precio
        localidad.text = viewModel.localidad
        rotulo.text = viewModel.rotulo
        if viewModel.logo != nil {
            logo.image = viewModel.logo
        } else {
            logo.image = UIImage(named: "nologo")
        }
 
    }

}
