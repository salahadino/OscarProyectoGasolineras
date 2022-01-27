//
//  ListView.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 27/1/22.
//

import UIKit

class ListView: UIViewController {
    
    
    static func createFromStoryboard() -> ListView {
        
        return UIStoryboard(name: "ListView", bundle: .main).instantiateViewController(withIdentifier: "ListView") as! ListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
