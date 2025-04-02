//
//  BreedDetailedView.swift
//  catOS
//
//  Created by rosadiez on 10/9/24.
//

import Foundation
import SwiftUI

struct BreedDetailedView: View {
    
    //public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = ""
    
    @ObservedObject var viewModel: BreedDetailedViewModel
    
    var body: some View {
        ScrollView {
            carruselImages
                .padding(.bottom, 10)
            breedDescription
                .padding(.bottom, 10)
            characteristics
        }
        .navigationTitle(viewModel.breed.name)
        .padding()
        .task {
            await viewModel.getImages()
        }
    }
    
    var carruselImages: some View {
        TabView(selection : $selection){
            ForEach(viewModel.images, id: \.id) { breedImage in
                AsyncImage(url: URL(string: breedImage.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                            .scaleEffect(2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .tabViewStyle(.page)
        .clipShape( RoundedRectangle(cornerRadius: 10))
        .aspectRatio(1.0, contentMode: .fill)
        /*
        .onReceive(timer, perform: { _ in
            withAnimation{
                print("selection is",selection)
                selection = viewModel.images[selectionInt].id
                selectionInt = selectionInt < viewModel.images.count - 1 ? selectionInt + 1 : 0
                
                
            }
        })
         */
    }
    
    var breedDescription: some View {
        VStack(alignment: .leading, content: {
            HStack(alignment: .firstTextBaseline, content: {
                Text("\(viewModel.breed.origin)")
                    .font(.body)
                    .bold()
                    .foregroundColor(.gray)
                    
                
                Text(viewModel.breed.id)
                    .font(.body)
                    .foregroundColor(.gray)
                    .italic()
            })
            Text(viewModel.breed.description)
                .font(.body)
            })
    }
    
    var characteristics: some View {
        VStack(alignment: .leading, content: {
            Text(viewModel.characteristicsTitle).bold()
            VStack {
                ForEach ((0..<viewModel.characteristicsViewModels.count), id: \.self) { index in
                    let viewModel = viewModel.characteristicsViewModels[index]
                    BreedCharacteristicsItemView(viewModel: viewModel)
                    Divider()
                }
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
        })
    }
}

struct BreedDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let useCase: GetFeedImagesUseCase = GetFeedImagesUseCaseDefault(apiManager: ApiManagerMock.shared)
        let viewModel: BreedDetailedViewModel = BreedDetailedViewModel(ApiManagerMock.getBreedExample(), getFeedImagesUseCase: useCase)
        BreedDetailedView(viewModel: viewModel)
    }
}
