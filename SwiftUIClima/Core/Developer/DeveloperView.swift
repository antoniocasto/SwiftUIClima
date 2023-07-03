//
//  DeveloperView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 03/07/23.
//

import SwiftUI

struct DeveloperView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let linkedInLink = "https://linkedin.com/in/antonio-casto-547a411a1"
    let githubLink = "https://github.com/antoniocasto"
    
    @State private var animation = false
    
    var body: some View {
        
        ZStack {
                        
            VStack {
                    
                Spacer()
                Spacer()
                
                developerImage
                
                Text("Antonio Casto")
                    .font(.title).bold().monospaced()
                    .foregroundStyle(.linearGradient(colors: [.accentColor, .accentColor.opacity(0.7), .accentColor], startPoint: .leading, endPoint: .trailing))
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(.top)
                
                Spacer()
                
                LinkLabelView(link: linkedInLink, iconSystemName: "link", text: "LinkedIn")
                
                LinkLabelView(link: githubLink, iconSystemName: "link", text: "GitHub")
                
                Spacer()
                                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animation)
        .onAppear {
            animation.toggle()
        }
        .background(gradient)
        
    }
    
    var developerImage: some View {
        Image("AntonioCasto")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: 3)
                    .foregroundStyle(.linearGradient(colors: [.accentColor, .colorOnLightGradient], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .rotationEffect(.degrees(animation ? 180 : 0))
            }
            .shadow(color: .accentColor, radius: 8, x: 0, y: 0)
    }
    
    // Used gradient
    var gradient: LinearGradient {
        if colorScheme == .dark {
            return Color.darkGradient
        } else {
            return Color.lightGradient
        }
    }
    
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
