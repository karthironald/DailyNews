//
//  NewsDetailsViewModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation

class NewsDetailsViewModel: NSObject {
    
    var news: Hit
    
    var wrappedTitle: String {
        news.title ?? "-"
    }
    var wrappedUrl: URL {
        URL(string: news.url ?? "") ?? URL(string: "https://www.apple.com")!
    }
    
    // MARK: - Init Methods
    
    init(news: Hit) {
        self.news = news
    }
    
}
