//
//  WeatherDetailSmallView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 17/06/23.
//

import SwiftUI

struct WeatherDetailSmallView: View {
    
    @AppStorage(AppTemperature.preferenceKey) private var temperatureUnit: AppTemperature = .celsius
        
    let weatherData: WeatherData
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    // Gradient for Lottie View circle border
    let angularGradient = LinearGradient(colors: [.clear, .white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        Group {
            
            let dayNight = weatherData.dayNight
            
            HStack(spacing: 12) {
                
                if let mainIcon = weatherData.weather[0].mainIcon[dayNight] {
                    LottieView(fileName: mainIcon)
                        .frame(width: screenWidth / 10, height: screenHeight / 10)
                        .padding()
                        .clipShape(Circle())
                        .background(
                            Circle()
                                .strokeBorder(angularGradient, lineWidth: 4)
                        )
                    
                }
                
                VStack(alignment: .leading) {
                    Text(weatherData.name)
                        .font(.title2)
                        .lineLimit(1)

                    
                    
                    Text(weatherData.weather[0].description.capitalizedSentence)
                        .font(.body)
                    
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Text(weatherData.main.temp.formatTemperatureWith(unit: .celsius, useFractionDigits: false, convertTo: temperatureUnit == .fahrenheit ? .fahrenheit : nil))
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal)
        }
    }
}
