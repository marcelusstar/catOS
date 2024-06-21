//
//  LoadingView.swift
//  catOS
//
//  Created by rosadiez on 21/6/24.
//

import Foundation
import SwiftUI

struct LoadingView: ViewModifier {
    
    @Binding var loading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if loading {
                        ProgressView(String(localized: "common.loading"))
                            .controlSize(.large)
                            .tint(Color.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background{
                                Color.white.opacity(0.5)
                            }
                    
                        }
                    
                    }
                    
                    
            )
    }
}
