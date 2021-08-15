//
//  NetworkingProvider.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 10/08/21.
//

import Foundation

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    func getCity(cityString: String, success: @escaping (_ city: City ) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(EndPoints.domain)\(cityString)\(EndPoints.appid)"
        guard let objectUrl = URL(string: url) else {
            print("URL error")
            return
        }
        
        URLSession.shared.dataTask(with: objectUrl) { (data, response, error) in
            
            guard let data = data else {
                print("Task error")
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
