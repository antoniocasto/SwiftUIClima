//
//  WeatherViewModel.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI
import Combine
import CoreLocation

@MainActor
final class WeatherViewModel: ObservableObject {
    
    // UserDefaults properties for user preferences
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    
    private let locationManager = LocationManager.shared
    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    // Location status
    @Published var location: CLLocationCoordinate2D? {
        didSet {
            if location != nil {
                Task {
                    await fetchWeatherDataByCoordinate()
                }
            }
        }
    }
    
    @Published var authStatus: CLAuthorizationStatus = .authorizedWhenInUse
    
    // Internet status
    @Published var isConnected = true
    
    // Weather data
    @Published var weatherData: WeatherData?
    @Published var weatherFetchError = false
    
    // Bottom Sheet
    @Published var bottomSheetScaleFactor: BottomSheetScaleFactor = .large
    
    init() {
        setupSubscribers()
    }
    
    /// Fetches weather data by coordinate.
    func fetchWeatherDataByCoordinate() async {
        
        guard let location = location else { return }
        
        do {
            weatherData = nil
            weatherData = try await WeatherDataService.fetchWeatherDataByCoordinate(location, locale: appLocale == .system ? SystemSettings.getSystemLocale() : appLocale.rawValue)
                        
        } catch {
            
            weatherFetchError = true
            
        }
        
    }
    
    private func setupSubscribers() {
        
        locationManager.$userLocation.sink { [weak self] location in
            
            self?.location = location?.coordinate
            
        }
        .store(in: &cancellables)
        
        locationManager.$authStatus.sink { [weak self] authStatus in
            
            self?.authStatus = authStatus
            
        }
        .store(in: &cancellables)
        
        networkManager.$isConnected.sink { [weak self] isConnected in
            
            withAnimation(.easeInOut(duration: 0.3)) {
                self?.isConnected = isConnected
            }
            
        }
        .store(in: &cancellables)
        
    }
    
}
