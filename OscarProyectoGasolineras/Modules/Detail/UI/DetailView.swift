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
    func stopIndicator()
    func showLoadError()
    
}

class DetailView: UIViewController {
   
    var presenter: DetailPresenterContract?
    
    let activityIndicator = UIActivityIndicatorView()
    
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
        
        setUpIndicator()

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


extension DetailView: DetailViewContract {
    func showLoadError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_error", comment: ""), message: NSLocalizedString("user_form_alert_not_loaded", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
   
    func stopIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func reloadData() {
  
        configure(with: presenter?.viewModel())

    }
    
}

extension DetailView {
    func setUpIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
        
        activityIndicator.startAnimating()
        
    }
    
}
