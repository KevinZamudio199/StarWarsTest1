//
//  GenericRequest.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 20/06/23.
//

import Alamofire

class GenericRequest {
    public var method: Alamofire.HTTPMethod
    
    public var path: String
    
    public var parameters: [String: Any]?
    
    public var encoding: ParameterEncoding = URLEncoding.default
    
    public var headers: [String: String]?
    
    init(method: Alamofire.HTTPMethod, path: String, parameters: [String : Any]? = nil, encoding: ParameterEncoding, headers: [String : String]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
    
}
