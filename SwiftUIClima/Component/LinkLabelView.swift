//
//  LinkLabelView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 03/07/23.
//

import SwiftUI

struct LinkLabelView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let link: String
    let iconSystemName: String
    let text: String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            HStack {
                
                Image(systemName: iconSystemName)
                
                Text(text)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorScheme == .dark ? Color.colorOnDarkGradient : Color.colorOnLightGradient)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal)
                                
        }
    }
}

struct LinkLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LinkLabelView(link: "https://google.com", iconSystemName: "link", text: "Google")
    }
}
