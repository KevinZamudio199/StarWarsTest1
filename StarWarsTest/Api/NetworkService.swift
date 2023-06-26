//
//  NetworkService.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 20/06/23.
//

import UIKit
import Alamofire
import RxSwift

protocol Initiable: Codable {
    init()
}

protocol NetworkService {
    func execute<T: Initiable>(_ request: GenericRequest) -> Observable<T?>

}

enum ServiceError: Error {
    case forbidden // Status code 403
    case notFound // Status code 404
    case internalServerError // Status code 500
}

enum ServiceErrorCode: Int {
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
}

public class NetworkServiceImpl: NetworkService {
    private static let manager = Session()
    private let encodeutils = EncodeUtils()
    
    func execute<T>(_ request: GenericRequest) -> Observable<T?> where T : Initiable {
        let url = request.path
        let headers = prepareHeaders(headers: request.headers)
        debugPrint("Servicio utilizado:", url)
        return Observable<T?>.create { [weak self] observer in
            let request = NetworkServiceImpl.manager.request(url, method: request.method,
                                                             parameters: request.parameters,
                                                             encoding: request.encoding,
                                                             headers: headers)
                .validate(statusCode: 200 ..< 300)
                .response { (response: AFDataResponse<Data?>) in
                    debugPrint(response)
                    
                    if let errors = response.error {
                        observer.onError(errors)
                    }
                    
                    switch response.result  {
                    case let .success(value):
                        do {
                            guard let data = response.data else {
                                observer.onNext(nil)
                                observer.onCompleted()
                                return
                            }
                            let str = String(decoding: data, as: UTF8.self)
                            if let decodedResponse = try self?.encodeutils.get(T.self, from: data) {
                                observer.onNext(decodedResponse)
                                observer.onCompleted()
                            }else {
                                observer.onError(EncodeUtilsErrors.cantDecodeData)
                            }
                        }catch {
                            observer.onError(error)
                        }
                    case let .failure(error):
                        do {
                            if let data = response.data,
                               let errorResponse = try self?.encodeutils.get(ErrorResponse.self, from: data) {
                                observer.onError(errorResponse)
                            }else {
                                observer.onError(error)
                            }
                        }catch {
                            switch response.response?.statusCode {
                            case ServiceErrorCode.forbidden.rawValue:
                                observer.onError(ServiceError.forbidden)
                            case ServiceErrorCode.notFound.rawValue:
                                observer.onError(ServiceError.notFound)
                            case ServiceErrorCode.internalServerError.rawValue:
                                observer.onError(ServiceError.internalServerError)
                            default:
                                observer.onError(error)
                            }
                        }
                        
                    }
                    
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private func prepareHeaders(headers rawHeaders: [String: String]?) -> HTTPHeaders? {
        var headers = HTTPHeaders()
        guard let rawHeaders = rawHeaders else { return headers }
        for case let (key, value) in rawHeaders {
            headers[key] = value
        }
        return headers
    }
    
    
}



