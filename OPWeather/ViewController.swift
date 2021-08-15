//
//  ViewController.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 10/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkingProvider.shared.getCity(cityString: "London") { (City) in
            
            print("Success OK")
            
        } failure: { (error) in
            print("Failure")
        }

    }


}

