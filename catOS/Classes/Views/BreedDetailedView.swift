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
    
    @StateObject var viewModel: BreedDetailedViewModel
    
    var body: some View {
        ScrollView {
            
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
        .navigationTitle(viewModel.breed.name)
        .padding()
        .task {
            await viewModel.getImages()
        }
    }
}

struct BreedDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: BreedDetailedViewModel = BreedDetailedViewModel(ApiManagerMock.getBreedExample(), apiManager: ApiManagerMock.shared)
        BreedDetailedView(viewModel: viewModel)
    }
}
