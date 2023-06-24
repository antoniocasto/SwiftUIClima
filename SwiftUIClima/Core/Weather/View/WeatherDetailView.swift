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
    
    @AppStorage(AppTemperature.preferenceKey) private var temperatureUnit: AppTemperature = .celsius
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    // Light Mode
    let lightGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0x87CEEB), .white]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // Dark Mode
    let darkGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0xFF6700), Color(hex: 0x232323)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return darkGradient
        } else {
            return lightGradient
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .top) {
                
                Group {
                    
                    if let weatherData = viewModel.weatherData {
                        
                        ZStack(alignment: .topTrailing) {

                            HStack(spacing: 16) {
                                
                                // Button to refresh data
                                refreshButton
                                
                                // Button to show context menu
                                contextMenuButton
                                
                            }
                            .padding()
                            
                            VStack {
                                
                                if viewModel.bottomSheetScaleFactor == .large {
                                    
                                    WeatherDetailLargeView(weatherData: weatherData)
                                        .transition(.move(edge: .top).combined(with: .opacity))
                                    
                                } else {
                                    
                                    WeatherDetailSmallView(weatherData: weatherData)
                                        .transition(.move(edge: .bottom).combined(with: .opacity))
                                        .padding(.top, 32)
                                    
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
            
        }
    }
    
    var refreshButton: some View {
        Button {
            LocationManager.shared.fetchLocation()
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
