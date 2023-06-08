//
//  WeatherServiceMock.swift
//  Weather_TIS_TaskTests
//
//  Created by Mohamad Shaikhon on 08/06/2023.
//

import Foundation
@testable import Weather_TIS_Task

class MockWeatherService: WeatherServing {
    var fetchCurrentWeatherCalled = false
    var fetchCurrentWeatherCityName: String?
    var fetchCurrentWeatherResult: Result<CurrentWeather, NetworkingResponseError>?
    
    func fetchCurrentWeather<DataModel: Decodable>(cityName: String, responseType: DataModel.Type) async -> Result<DataModel, NetworkingResponseError> {
        fetchCurrentWeatherCalled = true
        fetchCurrentWeatherCityName = cityName
        
        if let result = fetchCurrentWeatherResult as? Result<DataModel, NetworkingResponseError> {
            return result
        } else {
            return .failure(NetworkingResponseError.unknown)
        }
    }
}
