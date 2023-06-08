//
//  WeatherView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group {
            if let loc = locationManager.userLocation {
                Text("lat: \(loc.coordinate.latitude)")
            } else {
                Text("Waiting for user location")
                    .foregroundColor(.red)
            }
        }

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
