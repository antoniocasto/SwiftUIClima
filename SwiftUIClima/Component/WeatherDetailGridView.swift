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
            CardView(title: WeatherDetailGridView.sunrise, systemIcon: "sunrise", value: "06:20")
            CardView(title: WeatherDetailGridView.sunset, systemIcon: "sunset", value: "20:30")
            CardView(title: WeatherDetailGridView.wind, systemIcon: "wind", value: "7 km/h")
            CardView(title: WeatherDetailGridView.feelsLike, systemIcon: "thermometer.sun", value: "27°")
            CardView(title: WeatherDetailGridView.humidity, systemIcon: "humidity", value: "60%")
            CardView(title: WeatherDetailGridView.visibility, systemIcon: "eye.fill", value: "26 km")
            CardView(title: WeatherDetailGridView.pressure, systemIcon: "barometer", value: "1.011 hPa")
            CardView(title: WeatherDetailGridView.seaLevel, systemIcon: "water.waves", value: "140 m")
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
    static let seaLevel = LocalizedStringKey("WeatherDetailGridView.seaLevel")


}
