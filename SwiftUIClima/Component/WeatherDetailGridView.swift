//
//  WeatherDetailGridView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

struct WeatherDetailGridView: View {
    
    let weatherData: WeatherData
    
    var columns: [GridItem] = [.init(.flexible(), spacing: 16), .init(.flexible(), spacing: 16)]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 16) {
            CardView(title: WeatherDetailGridView.sunrise, systemIcon: "sunrise", value: weatherData.sys.sunrise24H)
            CardView(title: WeatherDetailGridView.sunset, systemIcon: "sunset", value: weatherData.sys.sunset24H)
            CardView(title: WeatherDetailGridView.wind, systemIcon: "wind", value: "\(Int(weatherData.wind.speed.rounded())) km/h")
            CardView(title: WeatherDetailGridView.feelsLike, systemIcon: "thermometer.sun", value: "\(weatherData.main.intFeelsLike)°")
            CardView(title: WeatherDetailGridView.humidity, systemIcon: "humidity", value: "\(weatherData.main.humidity)%")
            CardView(title: WeatherDetailGridView.visibility, systemIcon: "eye.fill", value: "\(weatherData.visibility / 1000) km")
            CardView(title: WeatherDetailGridView.pressure, systemIcon: "barometer", value: "\(weatherData.main.pressure) hPa")
        }
        
    }
}

extension WeatherDetailGridView {
    static let sunrise = LocalizedStringKey("WeatherDetailGridView.sunrise")
    static let sunset = LocalizedStringKey("WeatherDetailGridView.sunset")
    static let wind = LocalizedStringKey("WeatherDetailGridView.wind")
    static let feelsLike = LocalizedStringKey("WeatherDetailGridView.feelsLike")
    static let humidity = LocalizedStringKey("WeatherDetailGridView.humidity")
    static let visibility = LocalizedStringKey("WeatherDetailGridView.visibility")
    static let pressure = LocalizedStringKey("WeatherDetailGridView.pressure")
}
