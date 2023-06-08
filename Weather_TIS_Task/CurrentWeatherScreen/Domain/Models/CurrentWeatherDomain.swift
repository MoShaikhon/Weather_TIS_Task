//
//  CurrentWeatherDomain.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 08/06/2023.
//

import Foundation

struct CurrentWeatherDomain{
    let temperature, windSpeed, humidity, city, condition: String
    let iconURL: URL?
    static func EmptyInit()-> CurrentWeatherDomain {
        CurrentWeatherDomain(temperature: "", windSpeed: "", humidity: "", city: "", condition: "", iconURL: nil)
    }
}
