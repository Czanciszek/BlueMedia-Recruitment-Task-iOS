//
//  NetworkDispatcher.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import Foundation
import RxSwift

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
        request: APIRequest) -> Observable<T> where T: Decodable {
            
        do {
            let urlRequest = try createURLRequest(baseURLString: baseURLString, from: request)

            return dataTask(for: urlRequest)
                .flatMap { self.decodeResponse($0) }
        } catch {
            return Observable.error(error)
        }
    }

}

private extension NetworkDispatcher {
    
    func dataTask(for urlRequest: URLRequest) -> Observable<Data> {
        return Observable.create {
            observable in
            
            let task = URLSession.shared.dataTask(with: urlRequest) {
                (data, response, error) in
                if let error {
                    observable.onError(error)
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    observable.onError(NetworkError.invalidResponse)
                    return
                }
                
                let statusCode = httpResponse.statusCode
                guard 200...299 ~= statusCode else {
                    observable.onError(NetworkError.invalidStatusCode(statusCode))
                    return
                }
                
                guard let data = data else {
                    observable.onError(NetworkError.invalidResponse)
                    return
                }
                
                observable.onNext(data)
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
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
    
    func decodeResponse<T>(_ data: Data) -> Observable<T> where T: Decodable {
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return .just(response)
        } catch {
            return .error(NetworkError.decodingFailed)
        }
    }
}

