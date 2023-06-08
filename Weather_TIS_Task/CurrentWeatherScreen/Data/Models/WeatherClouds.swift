//
//  WeatherClouds.swift
//  Weather
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

struct WeatherClouds: Codable {
    let all: Int

    static func emptyInit() -> WeatherClouds {
        return WeatherClouds(all: 0)
    }
}
