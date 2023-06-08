//
//  WeatherService.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

protocol WeatherServing{
    func fetchCurrentWeather<DataModel: Decodable>(cityName: String, responseType: DataModel.Type) async -> Result<DataModel, NetworkingResponseError>
}

class WeatherService: WeatherServing{
    private let service: NetworkServing
    init(service: NetworkServing) {
        self.service = service
    }
    func fetchCurrentWeather<DataModel>(cityName: String, responseType: DataModel.Type) async -> Result<DataModel, NetworkingResponseError> where DataModel: Decodable{
        let url = WeatherServices.currentWeather(cityName: cityName)
        return await service.sendRequest(endpoint: url, responseDataModel: responseType)
    }
}
