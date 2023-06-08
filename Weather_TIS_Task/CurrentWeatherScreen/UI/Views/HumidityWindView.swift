//
//  Weather_TIS_TaskApp.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 06/06/2023.
//

import SwiftUI

struct HumidityWindView: View {
    
    var windSpeed: String
    var humidity: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Wind speed")
                    .font(.caption)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text("Humidity")
                    .font(.caption)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            HStack(spacing: 0) {
                Text(windSpeed).font(.title).padding(0)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text(humidity).font(.title).padding(0)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct DetailsCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityWindView(windSpeed: "22", humidity: "2%")
    }
}
