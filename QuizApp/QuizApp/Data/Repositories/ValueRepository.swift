//
//  ProductRepository.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

protocol ValueRepositoryProtocol {
    func getValueFromAPI(completionHandler: @escaping (Result<TestApi, ErrorModel>) -> Void)
}

final class ValueRepository: ValueRepositoryProtocol {
    func getValueFromAPI(completionHandler: @escaping (Result<TestApi, ErrorModel>) -> Void) {
        let valueRequest = ValueRequest()
        APIManager.shared.requestApi(type: valueRequest) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
