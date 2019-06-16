//
//  URLSessionExtensions.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import Foundation
import Combine

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case noInternetConnection
    case unknown
}

extension URLSession {
    func send(request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), RequestError> {
        AnyPublisher<(data: Data, response: HTTPURLResponse), RequestError> { subscriber in
            let task = self.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    let httpReponse = response as? HTTPURLResponse
                    if let data = data, let httpReponse = httpReponse, 200..<300 ~= httpReponse.statusCode {
                        _ = subscriber.receive((data, httpReponse))
                        subscriber.receive(completion: .finished)
                    }
                    else if let httpReponse = httpReponse {
                        if httpReponse.statusCode == NSURLErrorNotConnectedToInternet{
                            subscriber.receive(completion: .failure(.noInternetConnection))
                        }else{
                            subscriber.receive(completion: .failure(.request(code: httpReponse.statusCode, error: error)))
                        }
                    }
                    else {
                        subscriber.receive(completion: .failure(.unknown))
                    }
                }
            }
            subscriber.receive(subscription: AnySubscription(task.cancel))
            task.resume()
        }
    }
}

extension JSONDecoder: TopLevelDecoder {}
