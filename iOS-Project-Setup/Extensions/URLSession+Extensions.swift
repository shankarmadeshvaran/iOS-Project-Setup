//
//  URLSession+Extensions.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
    
    func dataTask(with url: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
    
    func downloadTask(with url: URLRequest, result: @escaping (Result<(URL, URLResponse), Error>) -> Void) -> URLSessionDownloadTask {
           return downloadTask(with: url) { (localURL, urlResponse, error) in
               if let error = error {
                   result(.failure(error))
                   return
               }
    
               guard let response = urlResponse, let url = localURL else {
                   let error = NSError(domain: "error", code: 0, userInfo: nil)
                   result(.failure(error))
                   return
               }
               result(.success((url, response)))
           }
       }
}
