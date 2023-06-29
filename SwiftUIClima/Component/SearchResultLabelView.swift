//
//  SearchResultLabelView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import SwiftUI

/// Label used for searched places in LocationsView.
struct SearchResultLabelView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            
            Text(subtitle)
                .font(.body)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .padding(.horizontal, 4)
                .background(Color.accentColor)
                .cornerRadius(6)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white)
                
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(18)
    }
}

struct SearchResultLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLabelView(title: "Title", subtitle: "IT")
    }
}
