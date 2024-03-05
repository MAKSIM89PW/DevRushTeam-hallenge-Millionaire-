//
//  QuestionErrorModel.swift
//  wwbm
//
//  Created by baikal on 29.02.2024.
//

import Foundation
//TODO: https://www.swiftbysundell.com/basics/error-handling/
//add desc error
enum QuestionErrorModel : Error {
    case urlError
    case responseError
    case decodeError
}
