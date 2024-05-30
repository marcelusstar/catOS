//
//  ErrorView.swift
//  catOS
//
//  Created by rosadiez on 29/5/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    var viewModel: ErrorViewModel
    
    var body: some View {
                
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)

            Text(viewModel.message)
                .foregroundColor(.black)
                .font(.title)
        }
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: ErrorViewModel = ErrorViewModel(message: "No internet connection")
        ErrorView(viewModel: viewModel)
    }
    
}
