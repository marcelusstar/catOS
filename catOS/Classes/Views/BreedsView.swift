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
                ForEach(viewModel.filteredOptions, id: \.self) { suggestion in
                    
                    Button {
                        viewModel.searchText = suggestion
                        dismissSearch()
                        print("Click")
                            } label: {
                               Label(suggestion, systemImage: "bookmark")
                            }
                }
                
            }
        }
        .searchable(text: $viewModel.searchText, suggestions: {
            ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
               Text(suggestion)
                 .searchCompletion(suggestion)
                 
             }
            
        })
        .onSubmit(of: .search) {
            print("fetch data from server to refresh with full search query")
            // viewModel.performQuery()
            //dismissSearch()
        }
        
        FeedView(viewModel: FeedViewModel(feedImages: []))
        
        
    }
}




#Preview {
    BreedsView(viewModel: BreedsViewModel())
}
