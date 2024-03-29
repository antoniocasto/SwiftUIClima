//
//  WeatherData.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 09/06/23.
//

import SwiftUI

/// Weather Model for data fetched from openweathermap.org
struct WeatherData: Decodable {
    
    let coord: Coordinates
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let sys: Sys
    let name: String
    let timezone: TimeInterval
    
    var sunrise24H: String {
        Date.convertToLocalTime(utcTimeInSeconds: sys.sunrise, timezoneInSeconds: timezone).getHourOfTheDay24HFormat()
    }
    
    var sunset24H: String {
        Date.convertToLocalTime(utcTimeInSeconds: sys.sunset, timezoneInSeconds: timezone).getHourOfTheDay24HFormat()
    }
    
    // Day or night
    var dayNight: Date.DayNight {
        return Date.checkDateNight(sunrise: Date.convertToLocalTime(utcTimeInSeconds: sys.sunrise, timezoneInSeconds: timezone), sunset: Date.convertToLocalTime(utcTimeInSeconds: sys.sunset, timezoneInSeconds: timezone), timezone: timezone)
    }
    
    struct Coordinates: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct Weather: Decodable {
        
        // Weather condition unique identifier
        let id: Int
        
        // Main weather conditions
        let main: String
        
        // Weather description
        let description: String
        
        // Weather icon
        var mainIcon: [Date.DayNight: String] {
            
            switch main {
            case "Thunderstorm":
                return [.day: "day-thunderstorm", .night: "night-thunderstorm"]
            case "Clouds":
                switch id {
                case 801:
                    return [.day: "day-few-clouds", .night: "night-few-clouds"]
                case 803:
                    return [.day: "day-broken-clouds", .night: "night-broken-clouds"]
                default:
                    return [.day: "day-scattered-clouds", .night: "night-scattered-clouds"]
                }
            case "Rain":
                switch id {
                case 521:
                    return [.day: "day-shower-rains", .night: "night-shower-rains"]
                default:
                    return [.day: "day-rain", .night: "night-rain"]
                }
            case "Snow":
                return [.day: "day-snow", .night: "night-snow"]
            case "Mist":
                return [.day: "day-mist", .night: "night-mist"]
            default:
                return [.day: "day-clear-sky", .night: "night-clear-sky"]
            }
        }
        
    }
    
    struct Main: Decodable {
        
        // Temperature
        let temp: Double
        
        // Human perception of the temperature
        let feelsLike: Double
        
        // Min temperature
        let tempMin: Double
        
        // Max temperature
        let tempMax: Double
        
        // Humidity in %
        let humidity: Int
        
    }
    
    struct Wind: Decodable {
        
        // Wind speed
        let speed: Double
        
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
