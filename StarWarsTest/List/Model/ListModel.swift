//
//  ListModel.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 23/06/23.
//

import Foundation

struct ListModelResponse: Initiable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ListResults]?
}

struct ListResults: Initiable {
    var name: String?
    var height: String?
    var mass: String?
    var hair_color: String?
    var skin_color: String?
    var eye_color: String?
    var birth_year: String?
    var gender: String?
    var homeworld: String?
}
