//
//  BreedListItemView.swift
//  catOS
//
//  Created by rosadiez on 9/9/24.
//

import Foundation
import SwiftUI

struct BreedListItemView: View {
    
    var viewModel: BreedListItemViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: viewModel.imageURL) { image in
                image
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            .frame(width: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, content: {
                Text(viewModel.breed.name).font(.title3).bold()
                Text(viewModel.breed.description).font(.body)
            })
            
                
                
        }
        
        
    }
}

struct BreedListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let breed = BreedsRepositoryMock.getBreedExample()
        let viewModel = BreedListItemViewModel(breed: breed)
        BreedListItemView(viewModel: viewModel)
    }
}
