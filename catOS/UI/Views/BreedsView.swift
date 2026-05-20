//
//  BreedsView.swift
//  catOS
//
//  Created by rosadiez on 7/5/24.
//

import Foundation
import SwiftUI

struct BreedsView: View {

    @StateObject var viewModel: BreedsViewModel = BreedsViewModel()
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        List {
            ForEach(viewModel.filteredBreeds, id: \.id) { breed in
                BreedListItemView(breed: breed)
                .frame(maxHeight: 130)
                .listRowInsets(EdgeInsets(top: 10,
                                          leading: 10,
                                          bottom: 10,
                                          trailing: 15))
            }
        }
        .navigationTitle(String(localized: "tab_title.breeds"))
        .searchable(text: $viewModel.searchText)
        .task {
            await viewModel.getBreeds()
        }
        .errorAlert($viewModel.error)
        .loading($viewModel.loadingData)
        
    }
}




#Preview {
    BreedsView(viewModel: BreedsViewModel())
}
