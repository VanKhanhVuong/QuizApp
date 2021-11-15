//
//  MainViewModel.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

protocol MainViewModelProtocol {
    func getValueTestApi()
}

protocol MainViewModelEvent: ViewModelEventBase {}

final class MainViewModel: MainViewModelProtocol {

    typealias ViewModelEvent = MainViewModelEvent
    weak var delegate: MainViewModelEvent?
    
    private var valueUseCaseProtocol: ValueUseCaseProtocol
    
    init(delegate: MainViewModelEvent) {
        self.delegate = delegate
        self.valueUseCaseProtocol = ValueUseCase()
    }
    
    func getValueTestApi() {
        valueUseCaseProtocol.getValueApi { [weak self] (result) in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let err):
                print(err)
            }
        }
    }
}
