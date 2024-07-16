//
//  OpenAIService.swift
//  AI Generator Image
//
//  Created by Almir Khialov on 16.07.2024.
//
import Foundation
import Alamofire

class OpenAIService {
    private let endPointURL = "https://api.openai.com/v1/images/generations" // Replace with the correct endpoint URL

    func generateImage(prompt: String) async throws -> OpenAIImageResponse {
        let body = OpenAIImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = [
            "Authorization": "Bearer YOUR_API_KEY_HERE" // Replace with your actual API key
        ]
        return try await AF.request(endPointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIImageResponse.self).value
    }
}

struct OpenAIImageResponse: Decodable {
    let data: [OpenAIImageURL]
}

struct OpenAIImageURL: Decodable {
    let url: String
}

struct OpenAIImageRequestBody: Encodable {
    let prompt: String
    let size: String
}
