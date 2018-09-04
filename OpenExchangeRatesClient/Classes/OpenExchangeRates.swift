//
//  OpenExchangeRates.swift
//  OpenExchangeRatesClient
//
//  Created by BaekSungwook on 9/2/18.
//  Copyright © 2018 BaekSungwook. All rights reserved.
//

import Foundation

public struct OpenExchangeRates: Decodable {
    public let timestamp: Double
    public let base: String
    public let rates: [String: Double]
    public let date: Date
    
    enum CodingKeys: String, CodingKey {
        case timestamp
        case base
        case rates
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
        base = try container.decode(String.self, forKey: .base)
        rates = try container.decode([String:Double].self, forKey: .rates)
        date = Date(timeIntervalSince1970: timestamp)
    }
}
