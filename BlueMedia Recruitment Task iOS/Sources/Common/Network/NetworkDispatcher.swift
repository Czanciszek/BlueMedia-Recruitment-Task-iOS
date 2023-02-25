//
//  NetworkDispatcher.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import Combine
import Foundation

enum NetworkError: Error {
    case invalidBaseURL
    case invalidFinalURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailed
}

final class NetworkDispatcher {
    
    func dispatch<T>(
        baseURLString: String,
        request: APIRequest)
        -> AnyPublisher<T, Error> where T: Decodable {
            
        do {
            let urlRequest = try createURLRequest(baseURLString: baseURLString, from: request)

            return dataTask(for: urlRequest)
                .flatMap { self.decodeResponse($0) }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

}

private extension NetworkDispatcher {
    
    func dataTask(for urlRequest: URLRequest) -> AnyPublisher<Data, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                            
                let statusCode = httpResponse.statusCode
                guard 200...299 ~= statusCode else {
                    throw NetworkError.invalidStatusCode(statusCode)
                }
                            
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func createURLRequest(baseURLString: String, from request: APIRequest) throws -> URLRequest {
        
        guard var components = URLComponents(string: baseURLString) else {
            throw NetworkError.invalidBaseURL
        }

        if let path = request.path {
            components.path.append(path)
        }

        var queryItems: [URLQueryItem] = []
        if let requestQueryItems = request.queryItems {
            queryItems.append(contentsOf: requestQueryItems.compactMap { $0 })
        }

        components.queryItems = queryItems.count > 0 ? queryItems : nil

        guard let url = components.url else {
            throw NetworkError.invalidFinalURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.requestMethod.asHTTPMethod()
        
        return urlRequest
    }
    
    func decodeResponse<T>(_ data: Data)
        -> AnyPublisher<T, Error> where T: Decodable {
        
        Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in NetworkError.decodingFailed }
            .eraseToAnyPublisher()
    }
}

