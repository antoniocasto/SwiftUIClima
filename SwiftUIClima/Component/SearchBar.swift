//
//  SearchBar.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 29/06/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searchActive: Bool
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.accentColor)
                
                TextField(SearchBar.searchPrompt, text: $searchText)
                    .foregroundColor(.white)
                    
            }
            .padding(8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .onTapGesture {
                withAnimation {
                    searchActive = true
                }
            }
            
            if searchActive {
                
                Button(SearchBar.cancelButtonText) {
                    
                    searchText = ""
                    
                    withAnimation {
                        searchActive = false
                    }
                    
                    hideKeyboard()
                    
                }
                .foregroundColor(.white)
                
            }
            
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), searchActive: .constant(true))
            .padding()
    }
}

extension SearchBar {
    static let searchPrompt = LocalizedStringKey("SearchBar.searchPrompt")
    static let cancelButtonText = LocalizedStringKey("SearchBar.cancelButtonText")
}
