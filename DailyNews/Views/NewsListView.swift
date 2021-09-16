//
//  NewsListView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(searchText: $searchText, isFetching: viewModel.isFetching)
                    .onChange(of: searchText, perform: { value in
                        viewModel.searchText = searchText
                    })
                    .zIndex(2) // Workaround: Added this to fix list selection issue
                
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
                .resignKeyboardOnDragGesture()
            }
            .navigationTitle("News")
        }
    }
    
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

