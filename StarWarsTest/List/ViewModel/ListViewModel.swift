//
//  ListViewModel.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 23/06/23.
//

import UIKit

class ListViewModel {
    
    let repository = ListRepository()
    var modelList = ListModelResponse()
    var delegate: ListViewProtocol?
    
    func onGetList(query: String) {
        repository.getList(query: query) { response, error in
            guard let model = response else {
                self.delegate?.didFailList()
                return
            }
            
            if error != nil {
                print("error")
                self.delegate?.didFailList()
            }else {
                self.modelList = model
                self.delegate?.didGetListView(data: model)
            }
        }
    }
    
}
