//
//  AddressResult.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import Foundation

/// Model used when searching for a place with autocompletion.
struct AddressResult: Hashable, Decodable {
    
    let name: String
    let country: String
    let lat: Double
    let lon: Double
    
}
