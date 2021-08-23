//
//  City.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 10/08/21.
//

import Foundation

struct City: Codable {
    //let coord: Coordinate?
    let weather: [Weather]?
    let main: Temperature?
    //let id: Int?
    let name: String?
    
}

struct Coordinate: Codable {
    let lon: Double?
    let lat: Double?
}

struct Weather: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

struct Temperature: Codable {
    let temp: Float?
}
