//
//  FilmsViewModel.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation
import UIKit

class FilmsViewModel: FilmViewModelProtocol {
    var delegate: FilmsViewProtocol?    
    var modelFilms = FilmDataResponse()
    let repository = FilmsRepository()
    
    func getFilmsData() {
        repository.getFilms { response, error in
            guard let model = response else {
                self.delegate?.didFailGetFilmsData(error: "Hubo error al obtener la response")
                return
            }
            
            if error != nil {
                self.delegate?.didFailGetFilmsData(error: "Ya traia un error")
            }else {
                self.modelFilms = model
                self.delegate?.didGetFilmsData(data: model)
            }
        }
    }
    
}
