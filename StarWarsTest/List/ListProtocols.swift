//
//  ListProtocols.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 23/06/23.
//

import Foundation

protocol ListViewProtocol: AnyObject {
    func didGetListView(data: ListModelResponse)
    func didFailList()
}


