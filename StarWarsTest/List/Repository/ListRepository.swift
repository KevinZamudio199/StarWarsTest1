//
//  ListRepository.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 23/06/23.
//

import UIKit
import RxSwift
import Alamofire

class ListRepository {
    var network =  NetworkServiceImpl()
    let disposedBag = DisposeBag()
    
    func getList(query: String, completion: @escaping (ListModelResponse?, Error?) -> Void)  {
       let path = "https://swapi.py4e.com/api/\(query)/"
        
        let request = GenericRequest(method: .get, path: path, encoding: JSONEncoding.default)
        
        network.execute(request).subscribe(
            onNext: {
                (response: ListModelResponse?) in
                debugPrint((try? EncodeUtils().getJSONString(from: response)) ?? "No se consumio bien el servicio")
                completion(response, nil)
                
            },
            onError: { (error: Error) in
                debugPrint(error.localizedDescription)
                
                completion(nil, error)
            }).disposed(by: disposedBag)
        
    }
    
    
}
