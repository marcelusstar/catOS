//
//  ViewExtension.swift
//  catOS
//
//  Created by rosadiez on 5/6/24.
//

import Foundation
import SwiftUI

extension View {
    func errorAlert(_ error: Binding<CatError?>) -> some View {
        self.modifier(ErrorAlert(error: error))
    }
}
