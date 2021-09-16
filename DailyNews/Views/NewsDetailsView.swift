//
//  NewsDetailsView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct NewsDetailsView: View {
    let viewModel: NewsDetailsViewModel
    
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            WebView(url: viewModel.wrappedUrl, isLoading: $isLoading)
                .navigationBarItems(trailing: loadingView())
        }
    }
    
    /**Checks and return the loading view based on loading state*/
    func loadingView() -> some View {
        Group {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            } else {
                EmptyView()
            }
        }
    }
    
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsDetailsView(viewModel: NewsDetailsViewModel(news: Helper.fetchSampleNews().hits.first!), isLoading: false)
        }
    }
}
