//
//  Request.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation
import Alamofire

protocol Request {
    associatedtype Reponse
    
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var url: URL { get }
    var parameters: Parameters { get }
    var httpHeaderFields: HTTPHeaders { get }
    var encoding: ParameterEncoding { get }
}

protocol QuizApiConfigure: Request {}

extension QuizApiConfigure {
    var baseURL: URL {
        return URL(string: "https://quizapp-5d372-default-rtdb.firebaseio.com/")!
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var url: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var httpHeaderFields: HTTPHeaders {
        return [:]
    }
}
