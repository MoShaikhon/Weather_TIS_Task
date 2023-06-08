//
//  CurrentWeather.swift
//  Weather
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

struct CurrentWeather: Codable, Equatable {
    
    let timezone, id: Int
    let name: String
    let coordinate: Coordinate
    let weatherItems: [WeatherItem]
    let base: String
    let mainValue: CurrentWeatherMainValue
    let visibility: Int
    let wind: WeatherWind
    let clouds: WeatherClouds
    let date: Int
    let sys: CurrentWeatherSys
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case base, visibility, wind, clouds, sys, timezone, id, name
        case weatherItems = "weather"
        case coordinate = "coord"
        case mainValue = "main"
        case date = "dt"
        case code = "cod"
    }
    static func == (lhs: CurrentWeather, rhs: CurrentWeather) -> Bool {
        lhs.id == rhs.id
    }
    static func emptyInit() -> CurrentWeather {
        return CurrentWeather(
            timezone: 0,
            id: 0,
            name: "",
            coordinate: Coordinate.emptyInit(),
            weatherItems: [],
            base: "",
            mainValue: CurrentWeatherMainValue.emptyInit(),
            visibility: 0,
            wind: WeatherWind.emptyInit(),
            clouds: WeatherClouds.emptyInit(),
            date: 0,
            sys: CurrentWeatherSys.emptyInit(),
            code: 0
        )
    }
}
