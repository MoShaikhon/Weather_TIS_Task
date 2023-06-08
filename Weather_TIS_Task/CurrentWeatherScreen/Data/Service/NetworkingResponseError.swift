//
//  NetworkingResponseError.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

enum NetworkingResponseError: Error {
    case parsingFailure
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var genericFailMessage: String {
        switch self {
        case .parsingFailure:
            return "uknown error"
        case .unauthorized:
            return "session timed out"
        default:
            return "Unknown error"
        }
    }
}
enum StatusCode: Int{
    case sucess = 200
    case unauthorized = 401
    case failure
}
