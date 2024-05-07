//
//  ContentView.swift
//  catOS
//
//  Created by ftbtappx on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FeedView(viewModel: FeedViewModel())
    }
}

#Preview {
    ContentView()
}
