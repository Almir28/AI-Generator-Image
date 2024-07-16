//
//  GeneratorView.swift
//  AI Generator Image
//
//  Created by Almir Khialov on 16.07.2024.
//

import SwiftUI

struct GeneratorView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View{
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "arrow.left")
                    .fontWeight(.semibold)
                    .frame(width: 60, height: 60)
                    .background(.gray.opacity(0.3))
                    .clipShape(Circle())
                
                
                Text("Choose a style of picture")
                    .font(.system(size: 32, weight: .black))
                
                AsyncImage(url: viewModel.image) { image in
                    image.resizable()
                        .scaledToFill()
                }placeholder: {
                    ProgressView ()
                        .tint(.white)
                    
                }
                .frame(width: 340, height: 400)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                HStack {
                    Text("Re-Generate")
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
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .foregroundColor(.white)
            }
            .navigationBarHidden(true)
        }
    }

#Preview {
    GeneratorView (viewModel: .init(prompt: "black cat", selectedStyle: .threeDRender))
    }
