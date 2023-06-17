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
    
    var scaleFactorValue: Double {
        switch self {
        case .small:
            return 1 / 3
        case .large:
            return 4 / 5
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
    @State private var sheetHeight: CGFloat = .zero
    
    
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
                                        
                }
                .frame(height: sheetHeight)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .offset(y: dragState)
                .gesture(
                    DragGesture()
                        .onChanged { dragValue in
                            dragState = dragValue.translation.height
                        }
                        .onEnded { dragValue in
                            
                            if dragValue.translation.height <= -100 {
                                scaleFactor = .large
                            } else if dragValue.translation.height >= 100 {
                                scaleFactor = .small
                            }
                            
                            sheetHeight = height * scaleFactor.scaleFactorValue
                            
                            dragState = .zero
                        }
                )
                .onAppear {
                    sheetHeight = height * scaleFactor.scaleFactorValue
                }
                .animation(.easeInOut(duration: 0.3), value: sheetHeight)
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
