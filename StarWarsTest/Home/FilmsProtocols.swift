//
//  FilmsProtocols.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import UIKit

protocol FilmRepositoryProtocol: AnyObject {
    func getFilms(completion: @escaping (FilmDataResponse?, Error?) -> Void)
}
protocol FilmViewModelProtocol: AnyObject{
    func getFilmsData()
    
}

protocol FilmsViewProtocol: AnyObject {
    func didGetFilmsData(data: FilmDataResponse)
    func didFailGetFilmsData(error: String)
}
