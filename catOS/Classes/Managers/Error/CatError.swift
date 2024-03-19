//
//  CatError.swift
//  catOS
//
//  Created by rosadiez on 18/3/24.
//

import Foundation

enum CatError: Error {
    case noInternet
    case internetConnection
    case serverError
    case badRequest
    case genericError
}
