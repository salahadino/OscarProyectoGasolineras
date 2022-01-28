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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(viewModel: ListCellViewModel) {

        precio.text = viewModel.precio
        localidad.text = viewModel.localidad
        rotulo.text = viewModel.rotulo
        logo.image = viewModel.logo
        
        
    }

}
