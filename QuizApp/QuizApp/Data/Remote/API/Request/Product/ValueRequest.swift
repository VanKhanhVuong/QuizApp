//
//  ValueRequest.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation
import Alamofire

struct ValueRequest: QuizApiConfigure {
    
    typealias Reponse = TestApi
    
    var path: String {
        return "test.json"
    }
    
    var parameters: Parameters {
        return [:]
    }
}
