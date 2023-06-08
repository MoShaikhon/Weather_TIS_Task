//
//  WeatherRepository.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

protocol WeatherReposing{
    func getCurrentWeather(at cityNamed: String) async -> Result<CurrentWeather, NetworkingResponseError>
}

class WeatherRepository: WeatherReposing{
    
    private let remoteService: WeatherServing
    
    init(remoteService: WeatherServing) {
        self.remoteService = remoteService
    }
    func getCurrentWeather(at cityNamed: String) async -> Result<CurrentWeather, NetworkingResponseError>{
        return await remoteService.fetchCurrentWeather(cityName: cityNamed, responseType: CurrentWeather.self)
    }
}

