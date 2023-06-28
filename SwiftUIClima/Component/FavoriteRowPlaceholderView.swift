//
//  FavoriteRowPlaceholderView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 28/06/23.
//

import SwiftUI

struct FavoriteRowPlaceholderView: View {
    @State private var start = UnitPoint(x: -1, y: 0)
    @State private var end = UnitPoint(x: 2, y: 0)
    
    let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.6), Color.gray.opacity(0.3)]), startPoint: start, endPoint: end))
            .onAppear {
                withAnimation(animation) {
                    start = UnitPoint(x: 2, y: 0)
                    end = UnitPoint(x: -1, y: 0)
                }
            }
    }
}

struct FavoriteRowPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRowPlaceholderView()
    }
}
