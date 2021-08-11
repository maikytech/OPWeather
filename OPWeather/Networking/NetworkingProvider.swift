//
//  NetworkingProvider.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 10/08/21.
//

import Foundation

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    func getCity(cityString: String){
        
        let url = "\(EndPoints.domain)\(cityString)\(EndPoints.appid)"
        let objectUrl = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: objectUrl!) { (data, _, error) in
            if let error = error{
                print("ERROR EN EL TASK")
            }
            else if let data = data{
                do {
                    let response = try JSONDecoder().decode(City.self, from: data)
                    
                    print("JSON VALIDO")
                }catch {
                    print("ERROR EN EL CATCH")
                }
            }
        }
        task.resume()
    }
}
