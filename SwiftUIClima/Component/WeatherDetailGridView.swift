//
//  WeatherDetailGridView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

struct WeatherDetailGridView: View {
    
    @AppStorage(AppTemperature.preferenceKey) private var temperatureUnit: AppTemperature = .celsius
    
    @AppStorage(AppSpeed.preferenceKey) private var speedUnit: AppSpeed = .metreSec
    
    @AppStorage(AppLength.preferenceKey) private var lengthUnit: AppLength = .kilometers
    
    let weatherData: WeatherData
    
    var columns: [GridItem] = [.init(.flexible(), spacing: 16), .init(.flexible(), spacing: 16)]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 16) {
            CardView(title: WeatherDetailGridView.sunrise, systemIcon: "sunrise", value: weatherData.sunrise24H)
            CardView(title: WeatherDetailGridView.sunset, systemIcon: "sunset", value: weatherData.sunset24H)
            CardView(title: WeatherDetailGridView.wind, systemIcon: "wind", value: weatherData.wind.speed.formatSpeedWith(unit: .metersPerSecond, useFractionDigits: false, convertTo: speedUnit == .milesHour ? .milesPerHour : nil))
            CardView(title: WeatherDetailGridView.feelsLike, systemIcon: "thermometer.sun", value: "\(weatherData.main.feelsLike.formatTemperatureWith(unit: .celsius, useFractionDigits: false, convertTo: temperatureUnit == .fahrenheit ? .fahrenheit : nil))")
            CardView(title: WeatherDetailGridView.humidity, systemIcon: "humidity", value: weatherData.main.humidity.formatted(.percent))
            CardView(title: WeatherDetailGridView.visibility, systemIcon: "eye.fill", value: (Double(weatherData.visibility)).formatLenghtWith(unit: .meters, useFractionDigits: false, convertTo: lengthUnit == .kilometers ? .kilometers : .miles))
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
