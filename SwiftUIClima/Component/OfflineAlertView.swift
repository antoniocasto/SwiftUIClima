//
//  OfflineAlertView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 17/06/23.
//

import SwiftUI

struct OfflineAlertView: View {
    var body: some View {
        VStack {
            Text(OfflineAlertView.offlineTitle)
                .fontWeight(.semibold)
            Text(OfflineAlertView.offlineMessage)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(.black.opacity(0.5))
    }
}

struct OfflineAlertView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineAlertView()
    }
}

extension OfflineAlertView {
    static let offlineTitle = LocalizedStringKey("OfflineAlertView.offlineTitle")
    static let offlineMessage = LocalizedStringKey("OfflineAlertView.offlineMessage")
}
