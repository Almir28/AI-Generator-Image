//
//  Welcome.swift
//  AI Generator Image
//
//  Created by Almir Khialov on 16.07.2024.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                Text("Start Creating Your Own Art Now")
                    .font(.system(size: 64, weight: .black))
                
                Spacer()
                
                NavigationLink(destination: { ContentView() }) {
                    HStack {
                        Text("Generate Image")
                        Image(systemName: "sparkles")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background {
                        LinearGradient(colors: [Color.blue, Color.purple, Color.pink, Color.orange,], startPoint: .topLeading, endPoint: .bottomTrailing)
                    }
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .clipShape(Capsule())
                }
            }
            .background(
                Image("welcome")
                    .ignoresSafeArea()
                
            )
            .padding()
        }
    }
}
#Preview {
    Welcome()
        .preferredColorScheme(.dark)
}
