//
//  LocationManager.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 08/06/23.
//

import Foundation
import CoreLocation

/// This class is a singleton object which fetches user location on demand.
final class LocationManager: NSObject, ObservableObject {
    
    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    @Published var authStatus: CLAuthorizationStatus = .authorizedWhenInUse
    
    static let shared = LocationManager()
    
    private override init() {
        super.init()
        
        // Set delegate and reduced accuracy
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
    }
    
    /// Starts user location fetching.
    func fetchLocation() {
        userLocation = nil
        manager.startUpdatingLocation()
    }
    
}

//MARK: - CLLocationManager Delegate methods

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            authStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        case .restricted:
            authStatus = .restricted
        case .denied:
            authStatus = .denied
        case .authorizedAlways:
            authStatus = .authorizedAlways
        case .authorizedWhenInUse:
            authStatus = .authorizedWhenInUse
        @unknown default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        if userLocation == nil {
                        
            // Publish user location
            userLocation = location
            
        }
        
        // Stop updating location
        manager.stopUpdatingLocation()
                
    }
    
}
