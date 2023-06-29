//
//  WeatherView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    
    @StateObject var viewModel: WeatherViewModel
        
    init(location: CLLocationCoordinate2D? = nil) {
        _viewModel = StateObject(wrappedValue: WeatherViewModel(coordinates: location))
    }
    
    var body: some View {
        
        Group {
            if viewModel.isSearchedLocation {
                content
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                NavigationStack {
                    content
                }
            }
        }
        
        
    }
    
    var content: some View {
        ZStack {
            
            if viewModel.authStatus == .denied || viewModel.authStatus == .restricted {
                
                MessageView(title: WeatherView.locationErrorTitle, description: WeatherView.locationErrorDescription, actionDescription: WeatherView.locationActionDescription, systemIcon: ErrorType.locationNotAvailable.icon, action: SystemSettings.openSettings)
                
            } else {
                
                if !viewModel.isConnected && viewModel.weatherData == nil {
                    
                    MessageView(title: WeatherView.connectionErrorTitle, description: WeatherView.connectionErrorDescription, actionDescription: WeatherView.connectionActionDescription, systemIcon: ErrorType.connectionNotAvailable.icon, action: SystemSettings.openSettings)
                        .onDisappear {
                            Task {
                                await viewModel.fetchWeatherDataByCoordinate()
                            }
                        }
                    
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
