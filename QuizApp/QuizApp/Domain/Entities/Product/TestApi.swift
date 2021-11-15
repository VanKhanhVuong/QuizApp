//
//  TestApi.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 13/11/2021.
//

import Foundation

struct TestApi: Codable {
    var test: String?

    enum CodingKeys: String, CodingKey {
        case test = "test"
    }
}

