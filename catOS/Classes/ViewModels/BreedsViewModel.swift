//
//  BreedsViewModel.swift
//  catOS
//
//  Created by rosadiez on 7/5/24.
//

import Foundation

class BreedsViewModel: ObservableObject {
    
    @Published var totalOptions = ["Holly", "Josh", "Rhonda", "Ted"]
    @Published var searchText = ""
    
    @Published var breeds: [Breed] = []
    
    
    var filteredOptions: [String] {
        guard !searchText.isEmpty else { return [] }
        return totalOptions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    @Published var suggestions = ["Holly", "Josh", "Rhonda", "Ted"]
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return totalOptions }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
}
