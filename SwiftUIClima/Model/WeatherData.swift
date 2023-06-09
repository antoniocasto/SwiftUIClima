//
//  WeatherData.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 09/06/23.
//

import Foundation

/// Weather Model for data fetched from openweathermap.org
struct WeatherData: Decodable {
    
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let sys: Sys
    let name: String
    
    struct Weather: Decodable {
        
        // Main weather conditions
        let main: String
        
        // Weather description
        let description: String
        
    }
    
    struct Main: Decodable {
        
        // Temperature
        let temp: Float
        
        // Human perception of the temperature
        let feelsLike: Float
        
        // Min temperature
        let tempMin: Float
        
        // Max temperature
        let tempMax: Float
        
        // Atmospheric pressure
        let pressure: Int
        
        // Humidity in %
        let humidity: Int
        
    }
    
    struct Wind: Decodable {
        
        // Wind speed
        let speed: Float
        
    }
    
    struct Sys: Decodable {
        
        // Country name
        let country: String
        
        // Sunrise hour in UNIX UTC
        let sunrise: TimeInterval
        
        // Sunset hour in UNIX UTC
        let sunset: TimeInterval
        
    }
    
}
