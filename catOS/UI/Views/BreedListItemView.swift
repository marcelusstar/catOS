//
//  BreedListItemView.swift
//  catOS
//
//  Created by rosadiez on 9/9/24.
//

import Foundation
import SwiftUI

struct BreedListItemView: View {
    
    @EnvironmentObject var navigator: Navigator
    
    @StateObject var viewModel: BreedListItemViewModel
    
    init(breed: Breed) {
        self._viewModel = StateObject(wrappedValue: BreedListItemViewModel(breed: breed))
    }
    
    init(viewModel: BreedListItemViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack {
            image
            description
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            navigator.push(CatScreens.breedDetails(viewModel.breed))
        }
    }
    
    var image: some View {
        AsyncImage(url: viewModel.imageURL) { image in
            image
                .image?
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .frame(width: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var description: some View {
        VStack(alignment: .leading, content: {
            Text(viewModel.breed.name).font(.title3).bold()
            Text(viewModel.breed.description).font(.body)
        })
    }
}

struct BreedListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let breed = BreedsRepositoryMock.getBreedExample()
        let viewModel = BreedListItemViewModel(breed: breed)
        BreedListItemView(viewModel: viewModel)
    }
}
