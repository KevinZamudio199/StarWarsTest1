//
//  EncodeUtils.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 20/06/23.
//

import Foundation

enum EncodeUtilsErrors: Error {
    case cantDecodeString
    case cantDecodeData
    case cantDecodeDictionary
}

struct EncodeUtils {
    func getJSONString<T>(from: T) throws -> String where T: Encodable {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(from)
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw EncodeUtilsErrors.cantDecodeString
        }
        return jsonString
    }

    func get<T>(_: T.Type, from json: String) throws -> T where T: Decodable {
        let jsonDecoder = JSONDecoder()
        guard let data = json.data(using: .utf8) else {
            throw EncodeUtilsErrors.cantDecodeData
        }
        let object = try jsonDecoder.decode(T.self, from: data)
        return object
    }

    func get<T>(_: T.Type, from data: Data) throws -> T where T: Decodable {
        let jsonDecoder = JSONDecoder()
        let object = try jsonDecoder.decode(T.self, from: data)
        return object
    }
    func getAnyDictionary<T>(from: T) throws -> [String: Any] where T: Encodable{
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(from)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw EncodeUtilsErrors.cantDecodeDictionary
        }
        return dictionary
    }
    func getJSONString(from: [String : Any]) -> String?{
        if let jsonData = try? JSONSerialization.data(withJSONObject: from, options: []) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
        }
        return nil
    }
}
