//
//  StringExtension.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 14/06/23.
//

import Foundation

extension String {
    
    var capitalizedSentence: String {
        
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        
        return firstLetter + remainingLetters
    }
    
}
