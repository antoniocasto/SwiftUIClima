//
//  Environment.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 09/06/23.
//

import Foundation

/// This Enum is used in order to configure environment variables.
enum EnvironmentVariable {
    
    // This Enum stores keys from Config.xcconfig file
    private enum Keys {
        
        static let apiKey = "API_KEY"
        
    }
    
    /// Get Info.plist dictionary.
    private static func getPlistInfoDictionary() -> [String: Any] {
       
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found.")
        }
        
        return dict
        
    }
    
    static func getApiKey() -> String {
        
        guard let apiKeyString = EnvironmentVariable.getPlistInfoDictionary()[Keys.apiKey] as? String else {
            
            fatalError("API Key not set in plist")
            
        }
        
        return apiKeyString
        
    }
    
}
