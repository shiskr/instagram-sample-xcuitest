//
//  OperationError.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 27.07.2023.
//

import Foundation

public enum OperationError: LocalizedError {
    case noUrlAvailable
    case noDataAvailable
    case cannotParseResponse
    case noInternetConnection
    case operationCancelled
    case cannotRefreshToken
    
    case error(message: String, code: Int?)
    
    public var errorDescription: String {
        switch self {
            case .noUrlAvailable: return "No url available."
            case .noDataAvailable: return "No data available."
            case .cannotParseResponse: return "Cannot parse response."
            case .noInternetConnection: return "No internet connection."
            case .operationCancelled: return ""
            case .cannotRefreshToken: return "Cannot refresh token."
            case .error(let message, _): return message
        }
    }
}

extension OperationError: Equatable {
    
}
