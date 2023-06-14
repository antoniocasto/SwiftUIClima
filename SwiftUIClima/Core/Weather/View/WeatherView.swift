//
//  WeatherView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        
        ZStack {
            
            if viewModel.authStatus == .denied || viewModel.authStatus == .restricted {
                
                ErrorView(title: WeatherView.locationErrorTitle, description: WeatherView.locationErrorDescription, actionDescription: WeatherView.locationActionDescription, systemIcon: ErrorType.locationNotAvailable.icon, action: SystemSettings.openSettings)
                
            } else {
                
                if !viewModel.isConnected && viewModel.weatherData == nil {
                    
                    ErrorView(title: WeatherView.connectionErrorTitle, description: WeatherView.connectionErrorDescription, actionDescription: WeatherView.connectionActionDescription, systemIcon: ErrorType.connectionNotAvailable.icon, action: SystemSettings.openSettings)
                    
                } else {
                    
                    WeatherDetailView()
                        .environmentObject(viewModel)
                    
                }
                
            }
            
        }
        
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

extension WeatherView {
    
    // Location
    static let locationErrorTitle = LocalizedStringKey("WeatherView.locationErrorTitle")
    static let locationErrorDescription = LocalizedStringKey("WeatherView.locationErrorDescription")
    static let locationActionDescription = LocalizedStringKey("WeatherView.locationActionDescription")
    
    // Connection
    static let connectionErrorTitle = LocalizedStringKey("WeatherView.connectionErrorTitle")
    static let connectionErrorDescription = LocalizedStringKey("WeatherView.connectionErrorDescription")
    static let connectionActionDescription = LocalizedStringKey("WeatherView.connectionActionDescription")
    
}
