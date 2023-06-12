//
//  WeatherDetailView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        Group {
            if let weatherData = viewModel.weatherData {
                
                Text("Weather data")
                
            } else {
                ProgressView {
                    Label(WeatherDetailView.fetchingWeather, systemImage: "icloud.and.arrow.down.fill")
                }
            }
        }
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView()
            .environmentObject(WeatherViewModel())
    }
}

extension WeatherDetailView {
    
    static let fetchingWeather = LocalizedStringKey("WeatherDetailView.fetchingWeather")
    
}
