//
//  ViewController.swift
//  OpenExchangeRatesClient
//
//  Created by shawnbaek on 09/02/2018.
//  Copyright (c) 2018 shawnbaek. All rights reserved.
//

import UIKit
import OpenExchangeRatesClient

class ViewController: UIViewController {
    
    let openExchangeRatesClient = OpenExchangeRatesClient(clientKey: "Enter your API Key")
    override func viewDidLoad() {
        super.viewDidLoad()
        print("version: \(OpenExchangeRatesClientVersionNumber)")
        openExchangeRatesClient.getRates(base: "USD") { (rates, error) in
            print("Base : \(String(describing: rates?.base))")
            print("Rates: \(String(describing: rates?.rates))")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

