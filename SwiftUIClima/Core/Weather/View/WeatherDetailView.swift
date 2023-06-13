//
//  WeatherDetailView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI

/// This is a subview used to display weather data.
struct WeatherDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    // Light Mode
    let lightGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0x003B70), Color(hex: 0x003B70), Color(hex: 0x003B70), Color(hex: 0x003B70), Color(hex: 0xEAF2FF)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // Dark Mode
    let darkGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0xFF6700), Color(hex: 0x232323)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // Gradient for Lottie View circle border
    let angularGradient = LinearGradient(colors: [.clear, .white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return darkGradient
        } else {
            return lightGradient
        }
    }
    
    var body: some View {
        
        Group {
            
            if let weatherData = viewModel.weatherData {
                
                let screenWidth = UIScreen.main.bounds.width
                let screenHeight = UIScreen.main.bounds.height
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        LottieView(fileName: "weather-day-clear-sky")
                            .frame(width: screenWidth / 2.5, height: screenHeight / 4.5)
                            .padding()
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .strokeBorder(angularGradient, lineWidth: 4)
                            )
                        
                        VStack {
                            
                            Text("Noto, IT")
                                .font(.largeTitle)
                            
                            Text("25°")
                                .font(.system(size: 80))
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                            
                            VStack(spacing: 8) {
                                Text("Clear sky")
                                HStack {
                                    Text("MAX: 26°")
                                    Text("MIN: 17°")
                                }
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        }
                        .foregroundColor(.white)
                        
                        WeatherDetailGridView(weatherData: weatherData)
                        .padding(.horizontal)
                        
                        
                    }
                    
                }
                .background(
                    gradient
                )
            } else {
                ProgressView {
                    Label(WeatherDetailView.fetchingWeather, systemImage: "icloud.and.arrow.down.fill")
                }
            }
        }
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView()
            .environmentObject(WeatherViewModel())
    }
}

extension WeatherDetailView {
    
    static let fetchingWeather = LocalizedStringKey("WeatherDetailView.fetchingWeather")
    
}
