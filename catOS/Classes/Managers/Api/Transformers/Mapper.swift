//
//  Mapper.swift
//  catOS
//
//  Created by rosadiez on 8/2/24.
//

import Foundation

protocol Mapper {
    associatedtype E
    associatedtype M

    func map(_ entity: E) -> M
}
