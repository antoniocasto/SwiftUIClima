//
//  LocationsView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI
import CoreLocation

struct LocationsView: View {
        
    @StateObject private var viewModel = LocationsViewModel()
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.results, id: \.hashValue) { result in
                    NavigationLink(value: result) {
                        SearchResultLabelView(title: result.name, subtitle: result.country)
                    }
                }
                
                Section(Self.favorites) {
                    ForEach(viewModel.locations) { location in
                        Text(location.uName)
                    }
                }
                
            }
            .navigationTitle(Self.navTitle)
            .navigationDestination(for: AddressResult.self) { result in
                WeatherView(location: CLLocationCoordinate2D(latitude: result.lat, longitude: result.lon))
            }
            .searchable(text: $viewModel.searchText, prompt: Self.searchPrompt)
            .onChange(of: viewModel.searchText) { newSearch in
                Task {
                    await viewModel.fetchCityNames()
                }
            }
            .onAppear {
                viewModel.fetchFavoriteLocations()
            }
        }
        
    }

}


struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

extension LocationsView {
    
    static let navTitle = LocalizedStringKey("LocationsView.navTitle")
    static let searchPrompt = LocalizedStringKey("LocationsView.searchPrompt")
    static let favorites = LocalizedStringKey("LocationsView.favorites")
    
}
