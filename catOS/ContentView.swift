//
//  ContentView.swift
//  catOS
//
//  Created by ftbtappx on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigator: Navigator = Navigator()
    
    var body: some View {
        TabsView()
            .environmentObject(navigator)
    }
}

#Preview {
    ContentView()
}
