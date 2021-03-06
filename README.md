# [OpenExchangeRates](https://openexchangerates.org/) for Swift


[![CI Status](https://img.shields.io/travis/shawnbaek/OpenExchangeRatesClient.svg?style=flat)](https://travis-ci.org/shawnbaek/OpenExchangeRatesClient)
[![Version](https://img.shields.io/cocoapods/v/OpenExchangeRatesClient.svg?style=flat)](https://cocoapods.org/pods/OpenExchangeRatesClient)
[![License](https://img.shields.io/cocoapods/l/OpenExchangeRatesClient.svg?style=flat)](https://cocoapods.org/pods/OpenExchangeRatesClient)
[![Platform](https://img.shields.io/cocoapods/p/OpenExchangeRatesClient.svg?style=flat)](https://cocoapods.org/pods/OpenExchangeRatesClient)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OpenExchangeRatesClient is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OpenExchangeRatesClient'
```

## How To Use

#### Sample 

```swift
let openExchangeRatesClient = OpenExchangeRatesClient(clientKey: "Enter Your APIKey")
openExchangeRatesClient.getRates(base: "USD") { (rates, error) in
    print("Base : \(String(describing: rates?.base))")
    print("Rates: \(String(describing: rates?.rates))")
    print("USD -> KRW, \(String(describing: rates?.rates["KRW"]))")
}
```

#### OpenExchangeRates.swift
```swift
struct OpenExchangeRates: Decodable {
    let timestamp: Double
    let base: String
    let rates: [String: Double]
    let date: Date

    enum CodingKeys: String, CodingKey {
        case timestamp
        case base
        case rates
    }
}

init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    timestamp = try container.decode(Double.self, forKey: .timestamp)
    base = try container.decode(String.self, forKey: .base)
    rates = try container.decode([String:Double].self, forKey: .rates)
    date = Date(timeIntervalSince1970: timestamp)
}
```



#### Response from OpenExchangeRates API
```javascript
{
    "disclaimer": "Usage subject to terms: https://openexchangerates.org/terms",
    "license": "https://openexchangerates.org/license",
    "timestamp": 1535799625,
    "base": "USD",
    "rates": {
        "AED": 3.673175,
        "AFN": 73.4825,
        "ALL": 108.99,
        "AMD": 482.915414,
        "ANG": 1.845847,
        "AOA": 276.2165,
        "ARS": 36.842,
        "AUD": 1.3906,
        "AWG": 1.792495,
        "AZN": 1.7025,
        "BAM": 1.677196,
        "BBD": 2,
        "BDT": 83.843139,
        "BGN": 1.685345,
        "BHD": 0.377138,
        "BIF": 1771.091778,
        "BMD": 1,
        "BND": 1.510944,
        "BOB": 6.910951,
        "BRL": 4.0551,
        "BSD": 1,
        "BTC": 0.000141123718,
        "BTN": 70.949974,
        "BWP": 10.747955,
        "BYN": 2.085752,
        "BZD": 2.010947,
        "CAD": 1.30475,
        "CDF": 1642.181123,
        "CHF": 0.968101,
        "CLF": 0.02338,
        "CLP": 681.6,
        "CNH": 6.8457,
        "CNY": 6.8302,
        "COP": 3044.005883,
        "CRC": 572.154399,
        "CUC": 1,
        "CUP": 25.5,
        "CVE": 94.5465,
        "CZK": 22.2039,
        "DJF": 178.05,
        "DKK": 6.4255,
        "DOP": 50.085,
        "DZD": 117.981224,
        "EGP": 17.7975,
        "ERN": 14.9965,
        "ETB": 27.64459,
        "EUR": 0.8612,
        "FJD": 2.110652,
        "FKP": 0.771545,
        "GBP": 0.771545,
        "GEL": 2.478217,
        "GGP": 0.771545,
        "GHS": 4.7455,
        "GIP": 0.771545,
        "GMD": 48.035,
        "GNF": 9049.579803,
        "GTQ": 7.563506,
        "GYD": 210.2347,
        "HKD": 7.84945,
        "HNL": 24.016446,
        "HRK": 6.4106,
        "HTG": 69.042165,
        "HUF": 281.52,
        "IDR": 14376.016583,
        "ILS": 3.607625,
        "IMP": 0.771545,
        "INR": 70.87,
        "IQD": 1193.793187,
        "IRR": 43163.27868,
        "ISK": 107.650208,
        "JEP": 0.771545,
        "JMD": 136.580012,
        "JOD": 0.709506,
        "JPY": 111.03955251,
        "KES": 100.68,
        "KGS": 68.137481,
        "KHR": 4093.290948,
        "KMF": 426.091764,
        "KPW": 900,
        "KRW": 1113.7,
        "KWD": 0.302721,
        "KYD": 0.833693,
        "KZT": 363.782619,
        "LAK": 8521.807802,
        "LBP": 1515.15,
        "LKR": 161.5701,
        "LRD": 154.249966,
        "LSL": 14.618602,
        "LYD": 1.378752,
        "MAD": 9.435534,
        "MDL": 16.760344,
        "MGA": 3336.551263,
        "MKD": 53.05,
        "MMK": 1534.332732,
        "MNT": 2442.166667,
        "MOP": 8.088022,
        "MRO": 357,
        "MRU": 35.95,
        "MUR": 34.3455,
        "MVR": 15.459996,
        "MWK": 727.31854,
        "MXN": 19.084528,
        "MYR": 4.117007,
        "MZN": 59.915,
        "NAD": 14.415,
        "NGN": 362.17,
        "NIO": 31.949515,
        "NOK": 8.3872,
        "NPR": 113.520796,
        "NZD": 1.51125,
        "OMR": 0.384915,
        "PAB": 1,
        "PEN": 3.30515,
        "PGK": 3.314782,
        "PHP": 53.417378,
        "PKR": 122.99,
        "PLN": 3.708649,
        "PYG": 5851.449587,
        "QAR": 3.640999,
        "RON": 3.999293,
        "RSD": 101.920145,
        "RUB": 67.516,
        "RWF": 880.861282,
        "SAR": 3.7503,
        "SBD": 7.88911,
        "SCR": 13.609587,
        "SDG": 18.074459,
        "SEK": 9.147479,
        "SGD": 1.3721,
        "SHP": 0.771545,
        "SLL": 8390,
        "SOS": 578.75178,
        "SRD": 7.458,
        "SSP": 130.2634,
        "STD": 21050.59961,
        "STN": 21.18,
        "SVC": 8.753777,
        "SYP": 514.97999,
        "SZL": 14.645416,
        "THB": 32.717,
        "TJS": 9.42761,
        "TMT": 3.504979,
        "TND": 2.761405,
        "TOP": 2.310538,
        "TRY": 6.545173,
        "TTD": 6.742907,
        "TWD": 30.687,
        "TZS": 2287.358006,
        "UAH": 28.26,
        "UGX": 3764.104986,
        "USD": 1,
        "UYU": 32.213818,
        "UZS": 7830.834431,
        "VEF": 248471.708907,
        "VES": 60.128839,
        "VND": 23114.337672,
        "VUV": 108.499605,
        "WST": 2.588533,
        "XAF": 564.910168,
        "XAG": 0.06879011,
        "XAU": 0.00083256,
        "XCD": 2.70255,
        "XDR": 0.713142,
        "XOF": 564.910168,
        "XPD": 0.00101796,
        "XPF": 102.768496,
        "XPT": 0.0012703,
        "YER": 250.349279,
        "ZAR": 14.687465,
        "ZMW": 10.31453,
        "ZWL": 322.355011
    }
}
```

## Author

shawnbaek, shawn@shawnbaek.com
