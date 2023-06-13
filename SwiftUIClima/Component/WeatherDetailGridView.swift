//
//  WeatherDetailGridView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

struct WeatherDetailGridView: View {
    
    let weatherData: WeatherData
    
    var columns: [GridItem] = [.init(.flexible(), spacing: 16), .init(.flexible(), spacing: 16)]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 16) {
            CardView(title: "Sunrise", systemIcon: "sunrise", value: "06:20")
            CardView(title: "Sunset", systemIcon: "sunset", value: "20:30")
            CardView(title: "Wind Speed", systemIcon: "wind", value: "7 km/h")
            CardView(title: "Feels Like", systemIcon: "thermometer.sun", value: "27°")
            CardView(title: "Humidity", systemIcon: "humidity", value: "60%")
            CardView(title: "Visibility", systemIcon: "eye.fill", value: "26 km")
            CardView(title: "Pressure", systemIcon: "barometer", value: "1.011 hPa")
            CardView(title: "Sea Level", systemIcon: "water.waves", value: "140 m")
        }
        
    }
}
