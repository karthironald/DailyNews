//
//  LoadingView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        HStack(spacing: 10) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            Text("Loading...")
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
