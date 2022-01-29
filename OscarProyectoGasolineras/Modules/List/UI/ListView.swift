//
//  ListView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 27/1/22.
//

import UIKit

protocol ListViewContract {
    
    var presenter: ListPresenterContract? {set get}
    func reloadData()

}

class ListView: UIViewController, ListViewContract {
  
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListPresenterContract?
    
    static func createFromStoryboard() -> ListView {
        
        return UIStoryboard(name: "ListView", bundle: .main).instantiateViewController(withIdentifier: "ListView") as! ListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.viewDidLoad()
        self.title = "Gasolineras con GLP"
    }
    
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}



extension ListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = presenter?.cellViewModel(at: indexPath) else { fatalError()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListViewCell else {
            fatalError()
        }
        
        cell.configure(viewModel: viewModel)
        
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
