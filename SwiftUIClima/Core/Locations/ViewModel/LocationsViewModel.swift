//
//  LocationsViewModel.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import SwiftUI

/// ViewModel for LocationsView.
final class LocationsViewModel: NSObject, ObservableObject {
    
    // Favorite Locations
    @Published var locations = [Location]()
    
    // Results
    @Published private(set) var results = [AddressResult]()
    @Published var searchActive = false
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
    
    /// Delete favorite locations included in the IndexSet.
    func deleteFavoriteLocations(indexSet: IndexSet) {
        
        for i in indexSet {
            let removedLocation = locations.remove(at: i)
            PersistenceManager.shared.container.viewContext.delete(removedLocation)
            PersistenceManager.shared.save()
        }
        
    }
    
    /// Fetches favorite locations.
    func fetchFavoriteLocations() {
        
        let request = Location.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        if let locations = try? PersistenceManager.shared.container.viewContext.fetch(request) {
            
            self.locations = locations
            
            
        } else {
            
            self.locations = []
            
        }
    }
    
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
