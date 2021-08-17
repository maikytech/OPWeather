//
//  HomeViewModel.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 12/08/21.
//

import Foundation

class HomeViewModel {
    
    //Update Data
    var refreshData = {
        () -> () in
    }
    
    public var dataArray: City? {
        didSet {
            refreshData()
        }
    }
    
    func getCity(cityString: String) {
        
        NetworkingProvider.shared.getCity(cityString: cityString) { (city) in
            print("VM ok")
            self.dataArray = city
            print(self.dataArray)
            
        } failure: { (error) in
            print(error.debugDescription)
        }

        
    }
    
}
