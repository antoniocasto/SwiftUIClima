//
//  LocationsViewModel.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import Foundation

/// ViewModel for LocationsView.
final class LocationsViewModel: NSObject, ObservableObject {
    
    // Results
    @Published private(set) var results = [AddressResult]()
    // Search input text
    @Published var searchText = "" {
        didSet {
            if searchText.isEmpty {
                results = []
            }
        }
    }
    // Error handling
    @Published var cityNamesFetchError = false

    
    /// This method searches for a location using the OpenWeatherMap Api
    @MainActor
    func fetchCityNames() async {
        
        guard !searchText.isEmpty else { return }
        
        do {
            results = try await GeocodingService.fetchCityNamesBy(searchText: searchText)
                                    
        } catch {
            cityNamesFetchError = true
        }
        
    }
    
}
