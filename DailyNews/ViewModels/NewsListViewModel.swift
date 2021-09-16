//
//  NewsListViewModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation

protocol NewsListViewModelProtocol {
    var news: [Hit] { get set }
    var searchText: String? { get set }
    
    func fetchNews(paginating: Bool, shouldReset: Bool)
}

class NewsListViewModel: NSObject, ObservableObject, NewsListViewModelProtocol {
    @Published var news: [Hit] = []
    @Published var searchText: String?
    
    func fetchNews(paginating: Bool, shouldReset: Bool) {
        news = Helper.fetchSampleNews().hits
    }
    
}
