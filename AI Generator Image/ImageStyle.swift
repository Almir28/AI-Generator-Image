//
//  ImageStyle.swift
//  AI Generator Image
//
//  Created by Almir Khialov on 16.07.2024.
//

import SwiftUI

enum ImageStyle: String, CaseIterable {
    case surrealism
    case realism
    case threeDRender
    case abstract
    case retro
    
    
    
    var title: String {
        switch self {
        case . surrealism:
            return "Surrealism"
            
        case .realism:
            return "Realism"
        case .threeDRender:
            return "ThreeDRender"
        case .abstract:
            return "Abstract"
        case .retro:
            return "Retro"
        }
    }
}

//github.com/NumPlay/RichText
