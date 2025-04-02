//
//  ButtonGradientOutline.swift
//  catOS
//
//  Created by rosadiez on 10/6/24.
//

import Foundation
import SwiftUI

struct ButtonGradientOutline: View {
    
    let action: () -> ()
    let iconName: String
    let colors: [Color]
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: iconName)
                .font(.system(size: 24, weight: .bold))
                .foregroundGradient(colors: colors)
                .padding()
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(gradient: .init(colors: colors),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing), lineWidth: 3))
        })
    }
}

struct ButtonGradientOutline_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGradientOutline(
            action: {
                print("It works!")
            },
            iconName: "cat",
            colors: [Color.red, Color.black, Color.yellow])
    }
}
