//
//  WeatherDetailLargeView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 17/06/23.
//

import SwiftUI

struct WeatherDetailLargeView: View {
    
    let weatherData: WeatherData
        
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    // Gradient for Lottie View circle border
    let angularGradient = LinearGradient(colors: [.clear, .white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        Group {
            
            let dayNight = weatherData.sys.dayNight
            
            if let mainIcon = weatherData.weather[0].mainIcon[dayNight] {
                LottieView(fileName: mainIcon)
                    .frame(width: screenWidth / 2.5, height: screenHeight / 4.5)
                    .padding()
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .strokeBorder(angularGradient, lineWidth: 4)
                    )
            }
            
            VStack {
                
                Text("\(weatherData.name), \(weatherData.sys.country)")
                    .font(.largeTitle)
                
                Text("\(weatherData.main.intTemp)°")
                    .font(.system(size: 80))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                
                VStack(spacing: 8) {
                    Text(weatherData.weather[0].description.capitalizedSentence)
                    HStack {
                        Text(WeatherDetailView.max) +
                        Text(": \(weatherData.main.intTempMax)°")
                        
                        Text(WeatherDetailView.min) +
                        Text(": \(weatherData.main.intTempMin)°")
                    }
                }
                .font(.title2)
                .fontWeight(.semibold)
                
            }
            .foregroundColor(.white)
            
            Spacer()
        }
    }
}
