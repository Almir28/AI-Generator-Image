//
//  ContentView.swift
//  AI Generator Image
//
//  Created by Almir Khialov on 16.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "arrow.left")
                    .fontWeight(.semibold)
                    .frame(width: 60, height: 60)
                    .background(.gray.opacity(0.3))
                    .clipShape(Circle())
                
                
                Text("Choose a style of picture")
                    .font(.system(size: 32, weight: .black))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10){
                        ForEach(ImageStyle.allCases, id: \.self){
                            imageStyle in
                            Button {
                                selectedStyle = imageStyle
                            }label:{
                                Image(imageStyle.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 200)
                                    .clipShape(.rect(cornerRadius: 20))
                                
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(colors:[Color.blue, Color.purple, Color.pink, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                    })
                            }
                        }
                    }
                }
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .tint(Color.yellow)
                
                NavigationLink(destination: { GeneratorView(viewModel: .init(prompt:promptText, selectedStyle: selectedStyle)) }) {
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
            
            .padding()
            .frame(width: .infinity)
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
