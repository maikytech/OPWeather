//
//  NetworkingProvider.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 10/08/21.
//

import Foundation
import CoreLocation

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    func fetchServiceByCity(cityString: String, success: @escaping (_ city: City ) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = EndPoints.domain + "q=" + cityString + EndPoints.appid
        guard let objectUrl = URL(string: url) else {
            print("URL error by city")
            return
        }
        
        URLSession.shared.dataTask(with: objectUrl) { (data, response, error) in
            guard let data = data else {
                print(error.debugDescription)
                return
            }
            do {
                let decoder = try JSONDecoder().decode(City.self, from: data)
                success(decoder)
            }catch let error {
                print("catch error: \(error.localizedDescription)")
                failure(error)
                }
        }.resume()
    }
    
    func fetchServiceByCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees, success: @escaping (_ city: City ) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(EndPoints.domain)lat=\(latitude)&lon=\(longitude)\(EndPoints.appid)"
        
        guard let objectUrl = URL(string: url) else {
            print("URL error by coordinates")
            return
        }
        
        URLSession.shared.dataTask(with: objectUrl) { (data, response, error) in
            guard let data = data else {
                print(error.debugDescription)
                return
            }
            do {
                let decoder = try JSONDecoder().decode(City.self, from: data)
                success(decoder)
                
            }catch let error {
                print("catch error: \(error.localizedDescription)")
                failure(error)
                }
        }.resume()
    }
}
