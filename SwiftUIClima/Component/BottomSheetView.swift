//
//  BottomSheetView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 17/06/23.
//

import SwiftUI

enum BottomSheetScaleFactor {
    case small
    case large
    
    var emptyScreenFactor: Double {
        switch self {
        case .small:
            return 1 / 5
        case .large:
            return 7 / 8
        }
    }
}

/// This is a Bottom Sheet view which accept a Content to be displayed.
///  It allows to configure the Bottom Sheet with two sizes: small and large.
struct BottomSheetView<Content: View>: View {
    
    @Binding var scaleFactor: BottomSheetScaleFactor
    
    @ViewBuilder
    let content: () -> Content
    
    @State private var dragState: CGFloat = .zero
    @State private var offset: CGFloat = .zero
    
    var body: some View {
        GeometryReader { proxy in
            
            let height = proxy.size.height
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 10)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    ScrollView {
                        content()
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 32)
                    .blur(radius: scaleFactor == .large ? 10.0 : 0.0)
                    
                }
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .offset(y: dragState + offset)
                .gesture(
                    DragGesture()
                        .onChanged { dragValue in
                            
                            guard (dragValue.translation.height > 0 && scaleFactor == .small) || scaleFactor == .large else { return }
                            
                            dragState = dragValue.translation.height
                        }
                        .onEnded { dragValue in
                            
                            if dragValue.translation.height <= -100 {
                                scaleFactor = .small
                                offset = height * scaleFactor.emptyScreenFactor
                            } else if dragValue.translation.height >= 100 {
                                scaleFactor = .large
                                offset = height * scaleFactor.emptyScreenFactor
                            }
                            
                            dragState = .zero
                        }
                )
                .onAppear {
                    offset = height * scaleFactor.emptyScreenFactor
                }
                .animation(.easeInOut(duration: 0.3), value: offset)
                .animation(.easeInOut(duration: 0.3), value: dragState)
            }
            
        }
        
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.red
                .ignoresSafeArea()
            
            BottomSheetView(scaleFactor: .constant(.small)) {
                Text("Bottom Sheet View")
            }
            
        }
    }
}
