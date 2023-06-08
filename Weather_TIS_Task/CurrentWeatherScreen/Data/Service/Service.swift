//
//  Service.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

protocol NetworkServing {
    func sendRequest<T: Decodable>(endpoint: URLBuilding, responseDataModel: T.Type) async -> Result<T, NetworkingResponseError>
}

struct NetworkService: NetworkServing {
    func sendRequest<T: Decodable>(
        endpoint: URLBuilding,
        responseDataModel: T.Type
    ) async -> Result<T, NetworkingResponseError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.query = endpoint.query
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case StatusCode.sucess.rawValue:
                guard let decodedResponse = try? JSONDecoder().decode(responseDataModel, from: data) else {
                    return .failure(.parsingFailure)
                }
                return .success(decodedResponse)
            case StatusCode.unauthorized.rawValue:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
