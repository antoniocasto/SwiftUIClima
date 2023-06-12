//
//  WeatherViewModel.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import Foundation
import Combine
import CoreLocation

final class WeatherViewModel: ObservableObject {
    
    private let locationManager = LocationManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var authStatus: CLAuthorizationStatus = .authorizedWhenInUse
    
    init() {
        setupSubscribers()
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
        
    }
    
}
