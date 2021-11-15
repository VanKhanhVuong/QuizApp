//
//  APIClient.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation
import Alamofire

final class APIManager {
    static var shared = APIManager()
    let jsonClient: JsonClientProtocol = JsonClient()
    private init() { }
}

extension APIManager {
    func requestApi<T: Request>(type: T, completionHandler: @escaping (Result<T.Reponse, ErrorModel>) -> Void) where T.Reponse : Codable {
        AF.request(type.url, method: type.method, parameters: type.parameters, encoding: type.encoding, headers: type.httpHeaderFields)
            .validate().responseJSON { data in
                switch data.result {
                case .success(_):
                    if let jsonData = data.data {
                        guard let response = self.jsonClient.jsonDecode(type: T.Reponse.self, jsonData: jsonData) else {
                            completionHandler(.failure(.unableToDecode))
                            return
                        }
                        completionHandler(.success(response))
                    }
                    break
                case .failure(_):
                    guard let response = data.response else { return }
                    completionHandler(.failure(ErrorModel.init(responseDataStatus: response)))
                    break
                }
            }
    }
}
