//
//  ProfileView.swift
//  catOS
//
//  Created by rosadiez on 11/5/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            
            List {
                HStack(alignment: .center, content: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .background(Color.brown)
                        
                    Text("The lord of the cats")
                        .background(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                })
                .background(Color.yellow)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink("Favorites ") {
                    Text("Not implemented favorites")
                }
                
                NavigationLink("Activity ") {
                    Text("Not implemented activity")
                }
                
                NavigationLink("Uploads ") {
                    Text("Not implemented uploads")
                }
                
            }
            .background(Color.red)
            .navigationTitle("Profile")
            
            
        }
        .background(Color.black)
        
    }
}

#Preview {
    ProfileView()
}
