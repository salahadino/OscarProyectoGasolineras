//
//  ListView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 27/1/22.
//

import UIKit

protocol ListViewContract: AnyObject {
    
    var presenter: ListPresenterContract? {set get}
    func reloadData()
    func stopIndicator()
    func showLoadError()

}

class ListView: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListPresenterContract?
    
    let activityIndicator = UIActivityIndicatorView()

    static func createFromStoryboard() -> ListView {
        
        return UIStoryboard(name: "ListView", bundle: .main).instantiateViewController(withIdentifier: "ListView") as! ListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.viewDidLoad()
        self.title = NSLocalizedString("tab_list", comment: "")
        
        searchBar.delegate = self
        searchBar.placeholder = NSLocalizedString("search_placeholder", comment: "")
        
        setUpIndicator()
       
    }
    
    
}


extension ListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = presenter?.cellViewModel(at: indexPath) else { fatalError()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListViewCell else {
            fatalError()
        }
        
        cell.configure(viewModel: viewModel)
        cell.selectionStyle = .none
        
        return cell
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numItems ?? 0
        
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
        
    }
}

extension ListView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.didSearch(with: searchText)
    }
}

extension ListView {
    
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

extension ListView: ListViewContract {
    
   
    func stopIndicator() {
        activityIndicator.stopAnimating()
    }
  

    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoadError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("user_form_alert_error", comment: ""), message: NSLocalizedString("user_form_alert_not_loaded", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("user_form_alert_accept", comment: ""), style: .default))
            self.present(alert, animated: true)
        }
    }
    
    
}
