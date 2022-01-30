//
//  Gasolinera.swift
//  OscarProyectoGasolineras
//
//  Created by Oscar Cazallas Esteban on 28/1/22.
//

import Foundation
import UIKit


struct Gasolinera: Codable {
    var listaEESSPrecio: [ListaEESSPrecio]


    enum CodingKeys: String, CodingKey {
        case listaEESSPrecio = "ListaEESSPrecio"
        
    }
    
}

struct ListaEESSPrecio: Codable, Equatable {
    let cp, direccion, horario, latitud: String?
    let localidad, longitud, margen, municipio: String?
    let precioGLP: String?
    let provincia, remision: String?
    let rotulo: String?
    let ideess, idMunicipio, idProvincia, idccaa: String?
    var distancia: String?
    
    var imagen: UIImage? {
        UIImage(named: rotulo ?? "placeholder")
    }
    

    enum CodingKeys: String, CodingKey {
        case cp = "C.P."
        case direccion = "Dirección"
        case horario = "Horario"
        case latitud = "Latitud"
        case localidad = "Localidad"
        case longitud = "Longitud (WGS84)"
        case margen = "Margen"
        case municipio = "Municipio"
        case precioGLP = "Precio Gases licuados del petróleo"
        case provincia = "Provincia"
        case remision = "Remisión"
        case rotulo = "Rótulo"
        case ideess = "IDEESS"
        case idMunicipio = "IDMunicipio"
        case idProvincia = "IDProvincia"
        case idccaa = "IDCCAA"
        
    }

}

