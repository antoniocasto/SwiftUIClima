//
//  SettingsView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @AppStorage(AppTemperature.preferenceKey) private var temperatureUnit: AppTemperature = .celsius
    @AppStorage(AppSpeed.preferenceKey) private var speedUnit: AppSpeed = .metreSec
    @AppStorage(AppLength.preferenceKey) private var lengthUnit: AppLength = .kilometers
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    @AppStorage(AppTheme.preferenceKey) private var appTheme: AppTheme = .system
        
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottom) {
                Form {
                    
                    Group {
                        // Unit measures
                        unitMeasuresSection
                        
                        // Theme section
                        themeSection
                        
                        // Locale section
                        localeSection
                                        
                        // Developer section
                        developerSection
                        
                    }
                    .listRowBackground(colorScheme == .dark ? Color.colorOnDarkGradient : Color.colorOnLightGradient)
                    .foregroundColor(.white)
                    
                }
                
                Text("SwiftUIClima 1.0.0")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    .padding()
            }
            .navigationTitle(Self.settings)
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(gradient)
        }
        
    }
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return Color.darkGradient
        } else {
            return Color.lightGradient
        }
    }
    
    var unitMeasuresSection: some View {
        Section {
           
            // Tempeature
            Picker(Self.temperaturePicker, selection: $temperatureUnit) {
                ForEach(AppTemperature.allCases, id: \.hashValue) { temp in
                    Text(temp.symbol)
                        .tag(temp)
                }
            }

            
            // Speed
            Picker(Self.speedPicker, selection: $speedUnit) {
                ForEach(AppSpeed.allCases, id: \.hashValue) { speed in
                    Text(speed.speedName)
                        .tag(speed)
                }
            }
            
            // Length
            Picker(Self.lengthPicker, selection: $lengthUnit) {
                ForEach(AppLength.allCases, id: \.hashValue) { length in
                    Text(length.lengthName)
                        .tag(length)
                }
            }
            
        } header: {
            Label(Self.unitMeasuresHeader, systemImage: "ruler")
        }
    }
    
    var themeSection: some View {
        Section {
            Picker(Self.themePicker, selection: $appTheme) {
                ForEach(AppTheme.allCases, id: \.hashValue) { theme in
                    Text(theme.themeName)
                        .tag(theme)
                }
            }
        } header: {
            Label(Self.themeHeader, systemImage: "paintpalette")
        }
    }
    
    var localeSection: some View {
        Section {
            Picker(Self.localePicker, selection: $appLocale) {
                ForEach(AppLocale.allCases, id: \.hashValue) { locale in
                    Text(locale.name)
                        .tag(locale)
                }
            }
        } header: {
            Label(Self.localeHeader, systemImage: "globe")
        }
    }
    
    var developerSection: some View {
        NavigationLink(destination: DeveloperView()
            .navigationBarBackButtonHidden(true)
        ){
            Text(Self.developer)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    static let settings = LocalizedStringKey("SettingsView.settings")
    static let unitMeasuresHeader = LocalizedStringKey("SettingsView.unitMeasuresHeader")
    static let temperaturePicker = LocalizedStringKey("SettingsView.temperaturePicker")
    static let speedPicker = LocalizedStringKey("SettingsView.speedPicker")
    static let lengthPicker = LocalizedStringKey("SettingsView.lengthPicker")
    static let themeHeader = LocalizedStringKey("SettingsView.themeHeader")
    static let themePicker = LocalizedStringKey("SettingsView.themePicker")
    static let localeHeader = LocalizedStringKey("SettingsView.localeHeader")
    static let localePicker = LocalizedStringKey("SettingsView.localePicker")
    static let developer = LocalizedStringKey("SettingsView.developer")
}
