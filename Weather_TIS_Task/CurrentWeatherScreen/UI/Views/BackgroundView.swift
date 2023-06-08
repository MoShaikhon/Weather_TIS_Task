//
//  Weather_TIS_TaskApp.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 06/06/2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        let cloudyColorScheme = [Color(red: 41/255, green: 128/255, blue: 184/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color.white]
                
        let gradient = Gradient(colors: cloudyColorScheme)
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        let background = Rectangle()
            .fill(linearGradient)
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
        return background
    }
}
