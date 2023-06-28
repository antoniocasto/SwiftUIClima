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
    
    private(set) var isSearchedLocation: Bool = false
    
    @Published var authStatus: CLAuthorizationStatus = .authorizedWhenInUse
    
    // Internet status
    @Published var isConnected = true
    
    // Weather data
    @Published var weatherData: WeatherData? {
        didSet {
            guard let _ = weatherData else { return }
            if isSearchedLocation {
                setLocationFavorite()
            }
        }
    }
    @Published var weatherFetchError = false
    
    // Favorite
    @Published var isFavorite = false
    
    // Bottom Sheet
    @Published var bottomSheetScaleFactor: BottomSheetScaleFactor = .large
    
    init(coordinates: CLLocationCoordinate2D? = nil) {
        
        if let coordinates = coordinates {
            // Used geocoding to obtain coordinates
            setNetworkManagerSubscriber()
            location = coordinates
            isSearchedLocation = true
        } else {
            // Use local coordinates
            setupSubscribers()
        }

    }
    
    /// Fetches weather data by coordinate.
    func fetchWeatherDataByCoordinate() async {
        
        guard let location = location else { return }
        
        do {
            weatherData = nil
                        
            let weather = try await WeatherDataService.fetchWeatherDataByCoordinate(location, locale: appLocale == .system ? SystemSettings.getSystemLocale() : appLocale.rawValue)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.weatherData = weather
            }
                        
        } catch {
            
            weatherFetchError = true
            
        }
        
    }
    
    /// This method checks if location has been added to favorites.
    private func setLocationFavorite() {
                
        guard let weatherData = weatherData else { return }
        
        let res = Location.fetchRequest()
        res.predicate = NSPredicate(format: "name == %@ AND country == %@", weatherData.name, weatherData.sys.country)
        
        if let location = try? PersistenceManager.shared.container.viewContext.fetch(res).first {
            
            isFavorite = true
            
        }
        
    }
    
    /// This method adds current location to favorites.
    func addLocationToFavorites() {
        
        guard let weatherData = weatherData else { return }
        
        let location = Location(context: PersistenceManager.shared.container.viewContext)
        location.name = weatherData.name
        location.country = weatherData.sys.country
        
        PersistenceManager.shared.save()
        
        isFavorite = true
                
    }
    
    /// This method removes current location to favorites.
    func removeLocationFromFavorites() {
        
        guard let weatherData = weatherData else { return }
        
        let res = Location.fetchRequest()
        res.predicate = NSPredicate(format: "name == %@ AND country == %@", weatherData.name, weatherData.sys.country)
        
        guard let location = try? PersistenceManager.shared.container.viewContext.fetch(res).first else { return }
        
        PersistenceManager.shared.container.viewContext.delete(location)
        
        PersistenceManager.shared.save()
        
        isFavorite = false
        
    }
    
    private func setupSubscribers() {
        
        setLocationManagerSubscriber()
        
        setNetworkManagerSubscriber()
        
    }
    
    private func setNetworkManagerSubscriber() {
        
        networkManager.$isConnected.sink { [weak self] isConnected in
            
            withAnimation(.easeInOut(duration: 0.3)) {
                self?.isConnected = isConnected
            }
            
        }
        .store(in: &cancellables)
        
    }
    
    private func setLocationManagerSubscriber() {
        
        locationManager.$userLocation.sink { [weak self] location in
            
            self?.location = location?.coordinate
            
        }
        .store(in: &cancellables)
        
        locationManager.$authStatus.sink { [weak self] authStatus in
            
            self?.authStatus = authStatus
            
        }
        .store(in: &cancellables)
    }
    
}
