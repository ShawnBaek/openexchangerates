//
//  QueryOperation.swift
//  OpenExchangeRates
//
//  Created by BaekSungwook on 9/2/18.
//  Copyright © 2018 BaekSungwook. All rights reserved.
//

/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

public typealias QueryResult = (OpenExchangeRates?, String) -> ()

class QueryOperation: AsyncOperation {
    private let defaultSession = URLSession(configuration: .default)
    var task: URLSessionDataTask?
    private let url: URL
    private let completion: QueryResult?
    private var rates: OpenExchangeRates?
    private var errorMessage = ""
    
    init(url: URL, completion: @escaping QueryResult) {
        self.url = url
        self.completion = completion
        super.init()
    }
    
    override func main() {
        task = defaultSession.dataTask(with: url) { data, response, error in
            defer { self.task = nil }
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let completion = self.completion {
                self.updateResults(data)
                DispatchQueue.main.async {
                    completion(self.rates, self.errorMessage)
                }
                self.state = .finished
            }
        }
        task?.resume()
    }
    
    // MARK: - Helper method
    private func updateResults(_ data: Data) {
        rates = nil
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decoded = try decoder.decode(OpenExchangeRates.self, from: data)
            rates = decoded
        } catch DecodingError.keyNotFound(let key, let context) {
            errorMessage += "Missing key in JSON: \(key) \(context)"
        } catch DecodingError.typeMismatch(let type, let context){
            errorMessage += "Wrong type in JSON: \(type) \(context)"
        } catch {
            errorMessage += "Failed to parse JSON: \(error.localizedDescription)"
        }
        
    }
    
}

