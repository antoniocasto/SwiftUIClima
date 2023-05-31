//
//  ContentViewModel.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
        
    private var cancellables = Set<AnyCancellable>()
    private let manager = LocalizationManager.shared
    
    @Published var locale: String?
    
    init() {
        setupSubscribers()
    }
    
    // DEBUG: Move to Settings
    func setLocale(with locale: LocalizationManager.Locale?) {
        manager.saveLocalePreference(locale: locale)
    }

    private func setupSubscribers() {
        
        // Subscribe to locale of the shared LocalizationManager instance
        manager.$locale.sink { [weak self] newLocale in
            self?.locale = newLocale?.rawValue
        }.store(in: &cancellables)
        
    }
    
}
