//
//  FilmFactory.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation

protocol FilmFactory {
    func makeGetFilmData(repository: FilmsRepository) -> FilmsViewModel
    func onGetFilmsData() -> FilmsRepository
}
