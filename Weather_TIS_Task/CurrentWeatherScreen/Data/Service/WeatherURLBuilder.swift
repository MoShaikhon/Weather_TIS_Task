//
//  WeatherURLBuilder.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

enum WeatherServices {
    case currentWeather(cityName: String)
}
extension WeatherServices: URLBuilding {
    var scheme: String {"https"}
    var method: RequestMethod {.get}
    var body: [String : String]? {nil}
    var host: String {"api.openweathermap.org"}
    var path: String {return "/data/2.5/weather"}
    var query: String {
        switch self {
        case .currentWeather(let cityName):
            return "APPID=\(API_KEY)&units=metric&q=\(cityName)"
        }
    }
    var headers: [String : String]? {nil}
}
