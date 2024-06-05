//
//  BreedsView.swift
//  catOS
//
//  Created by rosadiez on 7/5/24.
//

import Foundation
import SwiftUI

struct BreedsView: View {

    @ObservedObject var viewModel: BreedsViewModel
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredBreeds, id: \.self) { breedName in
                    
                    NavigationLink(breedName) {
                        Text("Selected: \(breedName)")
                    }
                }
            }
            .navigationTitle("Breeds")
        }
        .searchable(text: $viewModel.searchText)
        .task {
            await viewModel.getBreeds()
        }
        .errorAlert($viewModel.error)
        
    }
}




#Preview {
    BreedsView(viewModel: BreedsViewModel())
}
