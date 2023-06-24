//
//  TemperatureContextMenuLabelView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 24/06/23.
//

import SwiftUI

struct TemperatureContextMenuLabelView: View {
    
    var isSelected: Bool = false
    var temperatureUnit: AppTemperature = .celsius
    
    var body: some View {
        HStack {
                        
            Text(temperatureUnit.temperatureName) +
            Text(" (\(temperatureUnit.symbol))")
            
            if isSelected {
                Image(systemName: "checkmark")
            }
            
        }
    }
    
}

struct TemperatureContextMenuLabelView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureContextMenuLabelView()
    }
}
