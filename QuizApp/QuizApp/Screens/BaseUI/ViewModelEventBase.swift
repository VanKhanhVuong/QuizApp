//
//  ViewModelEventBase.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

protocol ViewModelType {
    associatedtype ViewModelEvent
    var delegate: ViewModelEvent? { get set }
    init(delegate: ViewModelEvent)
}

protocol ViewModelEventBase: AnyObject {
    func didBeginProcessing()
    func didFinishProcessing()
}
