//
//  NetworkManager.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import Foundation
import Network

/// This manager checks if internet connection is available.
final class NetworkManager: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    static let shared = NetworkManager()
    
    @Published var isConnected = true
    
    private init() {
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                // true if connection is available
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
        
    }
    
}
