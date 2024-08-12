//
//  BaseViewModel.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

class BaseViewModel: ObservableObject {
    
    let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
}
