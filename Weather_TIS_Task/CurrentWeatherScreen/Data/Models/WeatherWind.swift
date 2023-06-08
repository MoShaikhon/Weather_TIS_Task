//
//  WeatherWind.swift
//  Weather
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

struct WeatherWind: Codable {
    let speed: Double
    let deg: Int?
    
    static func emptyInit() -> WeatherWind {
        return WeatherWind(speed: 0.0, deg: nil)
    }
}
