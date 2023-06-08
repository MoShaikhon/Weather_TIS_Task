//
//  LocationAndTemperatureVIew.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import SwiftUI

struct LocationAndTemperatureView: View {
    var weatherName: String
    var cityName: String
    var iconURL: URL?
    var temperature: String

    var body: some View {
        VStack {
            Text(cityName)
                .font(.largeTitle)
                .fontWeight(.medium)
          
            HStack{
                Text(temperature)
                    .font(.system(size: 86))
                    .fontWeight(.thin)
                VStack(spacing: 0){
                    AsyncImage(url: iconURL, content: {image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    })
                        .frame(width: 100, height: 100, alignment: .top)
                    
                    Text(weatherName)
                        .font(.body)
                        .fontWeight(.light)
                }
            }
        }
        .padding(.vertical, 24)
    }
}
struct LocationAndTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndTemperatureView(weatherName: "cloudy", cityName: "cairo", temperature: "22")
    }
}
