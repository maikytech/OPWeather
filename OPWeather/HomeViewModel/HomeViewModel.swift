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
    
    public var dataArray: City? {
        didSet {
            refreshData()
        }
    }
    
    func getByCity(cityString: String, requestBy: String) {
        NetworkingProvider.shared.fetchServiceByCity(cityString: cityString) { (city) in
            print("getByCity ok")
            self.dataArray = city
            print(self.dataArray)
            
        } failure: { (error) in
            print(error.debugDescription)
            print("Error en getByCity")
        }
    }
    
    func getByCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        NetworkingProvider.shared.fetchServiceByCoordinates(latitude: latitude, longitude: longitude) { (city) in
            print("getByCoordinates ok")
            self.dataArray = city
            //print(self.dataArray)
            
        } failure: { (error) in
            print(error.debugDescription)
            print("Error en getByCoordinates")
        }
    }
}
