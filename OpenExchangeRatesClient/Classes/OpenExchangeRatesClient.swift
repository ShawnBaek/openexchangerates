//
//  OpenExchangeRatesManager.swift
//  OpenExchangeRates
//
//  Created by BaekSungwook on 9/2/18.
//  Copyright © 2018 BaekSungwook. All rights reserved.
//

import Foundation

public class OpenExchangeRatesClient {
    private let queue = OperationQueue()
    private let baseURL = "https://openexchangerates.org/api/latest.json?"
    private var apiKey: String

    public init(clientKey: String) {
        apiKey = "app_id=" + clientKey
    }
    
    public func getRates(base: String, _ to: String = "", completion: @escaping QueryResult) {
        queue.cancelAllOperations()
        // create QueryOperation
        guard var url = URLComponents(string: baseURL) else {
            return
        }
        url.query = "\(apiKey)&base=\(base)&symbols=\(to)"
        guard let apiURL = url.url else { return }
        let op = QueryOperation(url: apiURL) { tracks, error in
            DispatchQueue.main.async {
                completion(tracks, error)
            }
        }
        queue.addOperation(op)
    }
}
