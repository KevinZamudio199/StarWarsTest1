//
//  FilmsRepository.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 21/06/23.
//

import Foundation
import Alamofire
import RxSwift

class FilmsRepository {
    var network =  NetworkServiceImpl()
    let disposedBag = DisposeBag()
    
    func getFilms(completion: @escaping (FilmDataResponse?, Error?) -> Void)  {
       let path = "https://swapi.py4e.com/api/films/"
        
        let request = GenericRequest(method: .get, path: path, encoding: JSONEncoding.default)
        
        network.execute(request).subscribe(
            onNext: {
                (response: FilmDataResponse?) in
                debugPrint((try? EncodeUtils().getJSONString(from: response)) ?? "No se consumio bien el servicio")
                completion(response, nil)
                
            },
            onError: { (error: Error) in
                debugPrint(error.localizedDescription)
                
                completion(nil, error)
            }).disposed(by: disposedBag)
        
    }
    
    
}
