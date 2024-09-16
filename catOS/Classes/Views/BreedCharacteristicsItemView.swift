//
//  BreedCharacteristicsItemView.swift
//  catOS
//
//  Created by rosadiez on 16/9/24.
//

import Foundation
import SwiftUI

struct BreedCharacteristicsItemView: View {
    @ObservedObject var viewModel: BreedCharacteristicsItemViewModel
    var body: some View {
        HStack {
            Text(viewModel.name)
            Spacer()
            ForEach((0..<viewModel.maxScore), id: \.self) { index in
                
                if (index < viewModel.score) {
                    activeDot
                }
                else {
                    inactiveDot
                }
                
            }
        }
    }
    
    var dot: some View {
        Circle()
            .frame(width: 15, height: 15)
    }
    
    var activeDot: some View {
        dot.foregroundColor(.green)
    }
    
    var inactiveDot: some View {
        dot.foregroundColor(.gray)
    }
}

#Preview {
    let viewModel = BreedCharacteristicsItemViewModel(name: "Madness", score: 3)
    return BreedCharacteristicsItemView(viewModel: viewModel)
}
