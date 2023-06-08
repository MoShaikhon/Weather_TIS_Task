//
//  WeatherViewModel.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation
import Combine

@MainActor class WeatherViewModel: ObservableObject{
    private let repo: WeatherReposing
    @Published var currentWeatherDomain: CurrentWeatherDomain = CurrentWeatherDomain.EmptyInit()
    @Published var viewState: ViewState = .loading
    private var errorMessage = ""
    init(repo: WeatherReposing) {
        self.repo = repo
    }
    func getCurrentWeather() async{
        viewState = .loading
       let result = await repo.getCurrentWeather(at: "Cairo")
        switch result {
        case .success(let data):
            currentWeatherDomain = adapt(from: data)
            viewState = .success
        case .failure(let error):
            viewState = .failed
            errorMessage = error.genericFailMessage
        }
    }
    func retry() async {
        await getCurrentWeather()
    }
    func getErrorMessage()-> String{
        return errorMessage
    }
}
extension WeatherViewModel: Adapting{
    typealias FromType = CurrentWeather
    typealias ToType = CurrentWeatherDomain
    func adapt(from data: CurrentWeather) -> CurrentWeatherDomain {
        let iconName = data.weatherItems.first?.icon ?? ""
        return CurrentWeatherDomain(temperature: "\(Int(data.mainValue.temp))°",
                             windSpeed: "\(data.wind.speed) Km",
                             humidity: "\(data.mainValue.humidity)%",
                             city: "Cairo",
                             condition: data.weatherItems.first?.main ?? "",
                             iconURL: URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png")
        )
    }
}
