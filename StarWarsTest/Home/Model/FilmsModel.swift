//
//  FilmsModel.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation

struct FilmDataResponse: Initiable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [FilmsResults]?
}

struct FilmsResults: Initiable {
    var title: String?
    var episode_id: Int?
    var opening_crawl: String?
    var director: String?
    var producer: String?
    var release_date: String?
    var created: String?
    var edited: String?
    var url: String?
}
