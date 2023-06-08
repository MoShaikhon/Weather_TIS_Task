//
//  WeatherElement.swift
//  Weather
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

struct WeatherItem: Codable {
    let id: Int
    let main, weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    static func emptyInit() -> WeatherItem {
        return WeatherItem(
            id: 0,
            main: "",
            weatherDescription: "",
            icon: ""
        )
    }
}
