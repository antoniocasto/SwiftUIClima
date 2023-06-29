//
//  WeatherDetailView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI

/// This is a subview used to display weather data.
struct WeatherDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @AppStorage(AppTemperature.preferenceKey) private var temperatureUnit: AppTemperature = .celsius
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return Color.darkGradient
        } else {
            return Color.lightGradient
        }
    }
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            
            Group {
                
                if let weatherData = viewModel.weatherData {
                    
                    ZStack(alignment: .topTrailing) {
                        
                        VStack {
                            
                            if viewModel.bottomSheetScaleFactor == .large {
                                
                                WeatherDetailLargeView(weatherData: weatherData)
                                    .transition(.move(edge: .top).combined(with: .opacity))
                                
                            } else {
                                
                                WeatherDetailSmallView(weatherData: weatherData)
                                    .transition(.move(edge: .bottom).combined(with: .opacity))
                                
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .animation(.easeInOut(duration: 0.3), value: viewModel.bottomSheetScaleFactor)
                        
                        // Bottom Sheet
                        BottomSheetView(scaleFactor: $viewModel.bottomSheetScaleFactor) {
                            
                            // Grid for weather details
                            WeatherDetailGridView(weatherData: weatherData)
                                .padding(.horizontal)
                            
                        }
                        
                    }
                    
                    
                } else {
                    
                    // ProgressView shown when fetching data
                    ProgressView {
                        Label(WeatherDetailView.fetchingWeather, systemImage: "icloud.and.arrow.down.fill")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
            }
            .background(
                gradient
            )
            
            if !viewModel.isConnected {
                // Alert appearing when device is offline
                OfflineAlertView()
                    .transition(.move(edge: .top))
                    .zIndex(100)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if let _ = viewModel.weatherData {
                if viewModel.isSearchedLocation {
                    ToolbarItem(placement: .navigationBarLeading) {
                        // Back button
                        backButton
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Button to refresh data
                    refreshButton
                }
                
                if viewModel.isSearchedLocation {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        // Button to set/unset favorite
                        favoriteButton
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Button to show context menu
                    contextMenuButton
                }
            }
        }
        
    }
    
    var backButton: some View {
        Button {
            // Go back
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        
    }
    
    var favoriteButton: some View {
        Button {
            // Add/remove location to favorites
            if !viewModel.isFavorite {
                viewModel.addLocationToFavorites()
            } else {
                viewModel.removeLocationFromFavorites()
            }
            
            HapticEngine.triggerHaptic()
            
        } label: {
            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.white)
        }
    }
    
    var refreshButton: some View {
        Button {
            if !viewModel.isSearchedLocation {
                LocationManager.shared.fetchLocation()
            }
        } label: {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
                .foregroundColor(.white)
        }
    }
    
    var contextMenuButton: some View {
        Menu {
            ForEach(AppTemperature.allCases, id: \.hashValue) { temperatureUnit in
                Button {
                    self.temperatureUnit = temperatureUnit
                } label: {
                    TemperatureContextMenuLabelView(isSelected: self.temperatureUnit == temperatureUnit, temperatureUnit: temperatureUnit)
                }
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .imageScale(.large)
                .foregroundColor(.white)
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
    static let max = LocalizedStringKey("WeatherDetailView.max")
    static let min = LocalizedStringKey("WeatherDetailView.min")
    
}
