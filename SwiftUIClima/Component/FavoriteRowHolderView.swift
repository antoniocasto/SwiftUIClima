//
//  FavoriteRowHolderView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 28/06/23.
//

import SwiftUI
import CoreLocation

struct FavoriteRowHolderView: View {
    
    // UserDefaults properties for user preferences
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    
    let location: Location
    
    @State private var weatherData: WeatherData?
    
    var body: some View {
        Group {
            if let weatherData = weatherData {
                WeatherDetailSmallView(weatherData: weatherData)
            } else {
                FavoriteRowPlaceholderView()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .cornerRadius(20)
        .onAppear {
            Task {
                if let weather = try? await WeatherDataService.fetchWeatherDataByCoordinate(CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon), locale: appLocale == .system ? SystemSettings.getSystemLocale() : appLocale.rawValue) {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.weatherData = weather
                        }
                    }
                    
                }
                
                
            }
        }
    }
}

//struct FavoriteRowHolderView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteRowHolderView(name: "Berlin")
//    }
//}
