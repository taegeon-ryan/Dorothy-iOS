//
//  APIService.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/03.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
}

protocol APIServiceType {
    func response<T>(from request: T) -> AnyPublisher<T.Response, APIServiceError> where T: APIRequestType
}

final class APIService: APIServiceType {
    private let baseURL: URL
    init(baseURL: URL = URL(string: "http://172.20.10.2:4096")!) {
        self.baseURL = baseURL
    }

    func response<T>(from request: T) -> AnyPublisher<T.Response, APIServiceError> where T: APIRequestType {
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        
        let urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: T.Response.self, decoder: decoder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
