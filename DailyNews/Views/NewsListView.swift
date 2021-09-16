//
//  NewsListView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.news, id: \.objectID) { _news in
                NavigationLink(destination: NewsDetailsView(viewModel: NewsDetailsViewModel(news: _news))) {
                    NewsRowView(viewModel: NewsRowViewModel(news: _news))
                }
            }
            .onAppear(perform: {
                viewModel.fetchNews(paginating: false, shouldReset: false)
            })
            .navigationTitle("News")
        }
    }
    
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
