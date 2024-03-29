//
//  LocationsView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI
import CoreLocation

struct LocationsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some View {
        
        if !viewModel.isConnected {
            
            MessageView(title: WeatherView.connectionErrorTitle, description: WeatherView.connectionErrorDescription, actionDescription: WeatherView.connectionActionDescription, systemIcon: ErrorType.connectionNotAvailable.icon, action: SystemSettings.openSettings)
                .onDisappear {
                    viewModel.fetchFavoriteLocations()
                }
            
        } else {
            
            content
            
        }
        
    }
    
    var content: some View {
        NavigationStack {
            VStack {
                
                VStack {
                    SearchBar(searchText: $viewModel.searchText, searchActive: $viewModel.searchActive)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    if !viewModel.results.isEmpty {
                            // Search Results
                            searchResults
                    }
                }
                
                ZStack {
                    
                    List {
                        
                        Section{
                            // Favorite locations
                            favoriteLocations
                        } header: {
                            Text(!viewModel.locations.isEmpty ? Self.favorites : "")
                                .foregroundStyle(.secondary)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        
                    }
                    .scrollDismissesKeyboard(.immediately)
                    
                    if viewModel.locations.isEmpty {
                        MessageView(title: Self.noFavTitle, description: Self.noFavMessage, systemIcon: "heart.slash")
                    }
                    
                }
            }
            .background(gradient)
            .scrollContentBackground(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: AddressResult.self) { result in
                WeatherView(location: CLLocationCoordinate2D(latitude: result.lat, longitude: result.lon))
            }
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
    
    var searchResults: some View {
        ForEach(viewModel.results, id: \.hashValue) { result in
            NavigationLink(value: result) {
                SearchResultLabelView(title: result.name, subtitle: result.country)
            }
            .padding(.horizontal)
        }
        

    }
    
    var favoriteLocations: some View {
        ForEach(viewModel.locations) { location in
            FavoriteRowHolderView(location: location)
                .background(colorScheme == .dark ? Color.colorOnDarkGradient : Color.colorOnLightGradient)
                .overlay(
                    NavigationLink(value: AddressResult(name: location.uName, country: location.uCountry, lat: location.lat, lon: location.lon)) {
                        EmptyView()
                    }
                        .opacity(0)
                        
                )
        }
        .onDelete(perform: viewModel.deleteFavoriteLocations(indexSet:))
        .listRowSeparatorTint(Color.white)
        
    }
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return Color.darkGradient
        } else {
            return Color.lightGradient
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
    static let noFavTitle = LocalizedStringKey("LocationsView.noFavTitle")
    static let noFavMessage = LocalizedStringKey("LocationsView.noFavMessage")
    
}
