//
//  JsonClient.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

protocol JsonClientProtocol {
    func jsonDecode<T>(type: T.Type, jsonData: Data) -> T? where T: Codable
}

final class JsonClient: JsonClientProtocol {
    // JSON Data => Object
    func jsonDecode<T>(type: T.Type, jsonData: Data) -> T? where T: Codable {
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: jsonData)
            return object
        } catch {
            print("jsonDecode error: \(error)")
            return nil
        }
    }
}
