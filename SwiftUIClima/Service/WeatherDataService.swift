//
//  WeatherService.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 09/06/23.
//

import Foundation
import CoreLocation

/// Struct implementing an API service handling weather data.
struct WeatherDataService {
    
    // OpenWeatherMap base url
    private static let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    /// This function fetches weather data from the API in JSON format and converts it to a WeatherData model.
    /// If an error is raised, it returns nil.
    static func fetchWeatherDataByCoordinate(_ coordinate: CLLocationCoordinate2D, locale: String) async throws -> WeatherData? {
        
        // Get API KEY from Config.xcconfig file
        let apiKey = EnvironmentVariable.getApiKey()
        
        guard let url = URL(string: "\(baseUrl)?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(apiKey)&lang=\(locale)") else {
            fatalError("API URL creation failed.")
        }
        
        let request = URLRequest(url: url)
        
        // Perform request
        guard let (data, response) = try? await URLSession.shared.data(for: request) else { return nil }
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Deconde JSON data
        guard let decodedData = try? decoder.decode(WeatherData.self, from: data) else { return nil
        }
        
        return decodedData
        
    }
    
}
