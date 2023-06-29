//
//  GeocodingService.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import Foundation

/// Struct implementing an API service handling geocoding data.
struct GeocodingService {
    
    // OpenWeatherMap geocoding base url
    private static let baseUrl = "https://api.openweathermap.org/geo/1.0/direct"
    
    /// This function fetches city names from the API in JSON format and converts them using a AddressResult model.
    /// If an error is raised, it returns nil.
    static func fetchCityNamesBy(searchText text: String) async throws -> [AddressResult] {
        
        // Get API KEY from Config.xcconfig file
        let apiKey = EnvironmentVariable.getApiKey()
        
        let input = text
            .replacingOccurrences(of: " ", with: "%20")
            .folding(options: .diacriticInsensitive, locale: .current)
        
        guard let url = URL(string: "\(baseUrl)?q=\(input)&limit=1&appid=\(apiKey)") else {
            fatalError("API URL creation failed.")
        }
        
        let request = URLRequest(url: url)
        
        // Perform request
        guard let (data, response) = try? await URLSession.shared.data(for: request) else { return [] }
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return [] }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Deconde JSON data
        guard let decodedData = try? decoder.decode([AddressResult].self, from: data) else { return [] }
                        
        return decodedData
        
    }
    
}
