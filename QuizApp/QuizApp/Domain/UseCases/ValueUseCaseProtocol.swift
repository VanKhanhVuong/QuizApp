//
//  ProductUseCase.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

protocol ValueUseCaseProtocol {
    func getValueApi(completionHandler: @escaping (Result<TestApi, ErrorModel>) -> Void)
}

final class ProductUseCase: ValueUseCaseProtocol {
    private let valueRepository: ValueRepositoryProtocol = ValueRepository()
    
    func getValueApi(completionHandler: @escaping (Result<TestApi, ErrorModel>) -> Void) {
        valueRepository.getValueFromAPI(completionHandler: completionHandler)
    }
}

