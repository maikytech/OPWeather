//
//  HomeViewModel.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 12/08/21.
//

import Foundation
import CoreLocation

class HomeViewModel {
    
    //Update Data
    var refreshData = {
        () -> () in
    }
    
    public var dataArray: [City] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getByCity(cityString: String) {
        NetworkingProvider.shared.fetchServiceByCity(cityString: cityString) { (city) in
            self.dataArray.append(city)
        } failure: { (error) in
            print(error.debugDescription)
        }
    }
    
    func getByCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        NetworkingProvider.shared.fetchServiceByCoordinates(latitude: latitude, longitude: longitude) { (city) in
            print("getByCoordinates ok")
            //self.dataArray.append(city)
            //print(self.dataArray)
        } failure: { (error) in
            print(error.debugDescription)
        }
    }
}
