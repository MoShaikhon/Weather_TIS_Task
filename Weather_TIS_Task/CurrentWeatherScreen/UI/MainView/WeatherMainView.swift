//
//  WeatherMainView.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import SwiftUI

struct WeatherMainView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                if weatherViewModel.viewState  == .loading {
                    ProgressView("Loading…")
                }
                
                if weatherViewModel.viewState  == .success {
                    LocationAndTemperatureView(weatherName: weatherViewModel.currentWeatherDomain.condition, cityName: weatherViewModel.currentWeatherDomain.city, iconURL: weatherViewModel.currentWeatherDomain.iconURL, temperature: weatherViewModel.currentWeatherDomain.temperature)
                    VStack(spacing: 10) {
                        Rectangle().frame(height: CGFloat(1))
                        HumidityWindView(windSpeed: weatherViewModel.currentWeatherDomain.windSpeed, humidity: weatherViewModel.currentWeatherDomain.humidity)
                        Rectangle().frame(height: CGFloat(1))
                    }
                    Spacer()
                }
                
                if weatherViewModel.viewState == .failed{
                    Button {
                        Task{
                            await self.weatherViewModel.retry()
                        }
                    } label: {
                        Text("\(weatherViewModel.getErrorMessage()), retry?")
                            .foregroundColor(.white)
                    }
                }
            }
        }.task {
            await weatherViewModel.getCurrentWeather()
            
        }
        .colorScheme(.dark)
    }
}

