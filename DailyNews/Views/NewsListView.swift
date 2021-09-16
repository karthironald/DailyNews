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
            List {
                ForEach(viewModel.news, id: \.objectID) { _news in
                    NavigationLink(destination: NewsDetailsView(viewModel: NewsDetailsViewModel(news: _news))) {
                        NewsRowView(viewModel: NewsRowViewModel(news: _news))
                    }
                }
                
                if !viewModel.isAllHitsFetched && viewModel.news.count > 0 { // To initiate pagination
                    LoadingView()
                    .onAppear(perform: {
                        viewModel.fetchNews(paginating: true, shouldReset: false)
                    })
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("News")
            .navigationBarItems(trailing: loadingView())
        }
    }
 
    /**Checks and return the loading view based on loading state*/
    func loadingView() -> some View {
        Group {
            if viewModel.isFetching {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            } else {
                EmptyView()
            }
        }
    }
    
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

