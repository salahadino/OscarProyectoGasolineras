//
//  Gasolinera.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import Foundation
import UIKit

// MARK: - Gasolinera
struct Gasolinera: Codable {
    var listaEESSPrecio: [ListaEESSPrecio]


    enum CodingKeys: String, CodingKey {
        case listaEESSPrecio = "ListaEESSPrecio"
        
    }
    
  
}

struct ListaEESSPrecio: Codable, Equatable {
    let cP, dirección, horario, latitud: String?
    let localidad, longitud, margen, municipio: String?
    let precioX0020Biodiesel, precioX0020Bioetanol, precioX0020GasX0020NaturalX0020Comprimido, precioX0020GasX0020NaturalX0020Licuado: String?
    let precioGLP, precioX0020GasoleoX0020A, precioX0020GasoleoX0020B, precioX0020GasoleoX0020Premium: String?
    let precioX0020GasolinaX002095_X0020E10, precioX0020GasolinaX002095_X0020E5, precioX0020GasolinaX002095_X0020E5X0020Premium, precioX0020GasolinaX002098_X0020E10: String?
    let precioX0020GasolinaX002098_X0020E5, precioX0020Hidrogeno, provincia, remisión: String?
    let rotulo, tipoX0020Venta, x0025X0020BioEtanol, x0025X0020ÉsterX0020Metílico: String?
    let ideess, idMunicipio, idProvincia, idccaa: String?
    
    var distancia: String?
    //var imagen = UIImage(named: "placeholder")
    
    var imagen: UIImage? {
        UIImage(named: rotulo ?? "placeholder")
    }
    


    enum CodingKeys: String, CodingKey {
        case cP = "C.P."
        case dirección = "Dirección"
        case horario = "Horario"
        case latitud = "Latitud"
        case localidad = "Localidad"
        case longitud = "Longitud (WGS84)"
        case margen = "Margen"
        case municipio = "Municipio"
        case precioX0020Biodiesel = "Precio_x0020_Biodiesel"
        case precioX0020Bioetanol = "Precio_x0020_Bioetanol"
        case precioX0020GasX0020NaturalX0020Comprimido = "Precio_x0020_Gas_x0020_Natural_x0020_Comprimido"
        case precioX0020GasX0020NaturalX0020Licuado = "Precio_x0020_Gas_x0020_Natural_x0020_Licuado"
        case precioGLP = "Precio Gases licuados del petróleo"
        case precioX0020GasoleoX0020A = "Precio_x0020_Gasoleo_x0020_A"
        case precioX0020GasoleoX0020B = "Precio Gasoleo B"
        case precioX0020GasoleoX0020Premium = "Precio_x0020_Gasoleo_x0020_Premium"
        case precioX0020GasolinaX002095_X0020E10 = "Precio_x0020_Gasolina_x0020_95_x0020_E10"
        case precioX0020GasolinaX002095_X0020E5 = "Precio_x0020_Gasolina_x0020_95_x0020_E5"
        case precioX0020GasolinaX002095_X0020E5X0020Premium = "Precio_x0020_Gasolina_x0020_95_x0020_E5_x0020_Premium"
        case precioX0020GasolinaX002098_X0020E10 = "Precio_x0020_Gasolina_x0020_98_x0020_E10"
        case precioX0020GasolinaX002098_X0020E5 = "Precio_x0020_Gasolina_x0020_98_x0020_E5"
        case precioX0020Hidrogeno = "Precio_x0020_Hidrogeno"
        case provincia = "Provincia"
        case remisión = "Remisión"
        case rotulo = "Rótulo"
        case tipoX0020Venta = "Tipo_x0020_Venta"
        case x0025X0020BioEtanol = "_x0025__x0020_BioEtanol"
        case x0025X0020ÉsterX0020Metílico = "_x0025__x0020_Éster_x0020_metílico"
        case ideess = "IDEESS"
        case idMunicipio = "IDMunicipio"
        case idProvincia = "IDProvincia"
        case idccaa = "IDCCAA"
        
        
    }

}

