//
//  ErrorResponse.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation

struct ErrorResponse: Codable, Error {
    /** Código único de error para identificación de errores */
    let code: String
    /** Detalles específicos del error, digeribles para el usuario final */
    var details: String?
    /** Ubicación específica del error dentro del microservicio */
    var location: String?
    /** Campo utilizado para agregar información adicional del error */
    var moreInfo: String?
    /** UUID de 128 bits utilizado para trazabilidad */
    var uuid: String?
    /** Timestamp del error */
    var timestamp: String?
}
