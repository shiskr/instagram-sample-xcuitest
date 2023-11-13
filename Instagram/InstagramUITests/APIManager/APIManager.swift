//
//  APIManager.swift
//  LiveLikeTestAppUITests
//
//  Created by Shishir on 24/08/21.
//
import Foundation
import UIKit

// swiftlint:disable force_try
class APIManager {
    
//    private static func createAndScheduleWidget<T: Encodable>(
//        url: URL,
//        apiToken: String,
//        payload: T,
//        completion: @escaping (Result<String, Error>) -> Void
//    ) {
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let encoder = JSONEncoder()
//        request.httpBody = try! encoder.encode(payload)
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                return completion(.failure(error))
//            }
//            guard let response = response as? HTTPURLResponse else {
//                return completion(.failure(MyError("Response is not HTTPURLResponse")))
//            }
//            guard response.statusCode >= 200, response.statusCode < 300 else {
//                if response.statusCode == 401 {
//                    return completion(.failure(MyError("API Token was invalid.")))
//                } else {
//                    return completion(.failure(MyError("Request failed with status code: \(response.statusCode)")))
//                }
//            }
//            guard let data = data else {
//                return completion(.failure(MyError("Server returned no data.")))
//            }
//            guard let dataString = String(data: data, encoding: .utf8) else {
//                return completion(.failure(MyError("Failed to encode data with utf8")))
//            }
//            guard let widgetCreatedResponse = try? JSONDecoder().decode(WidgetCreatedResponse.self, from: data) else {
//                return completion(.failure(MyError("Failed to decode data as WidgetCreatedResponse")))
//            }
//            schedule(url: widgetCreatedResponse.schedule_url, apiToken: apiToken) { _ in
//                completion(.success(dataString))
//            }
//        }.resume()
//    }
    
    struct MyError: LocalizedError {
        private let string: String
        
        init(_ string: String) {
            self.string = string
        }
        
        var errorDescription: String? {
            return string
        }
    }
}
