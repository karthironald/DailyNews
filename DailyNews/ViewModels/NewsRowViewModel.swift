//
//  NewsRowViewModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation

class NewsRowViewModel: NSObject {
    
    var news: Hit
    var wrappedTitle: String {
        news.title ?? "-"
    }
    var wrappedDate: String {
        news.createdAt ?? "-"
    }
    
    // MARK: - Init Methods
    
    init(news: Hit) {
        self.news = news
    }
    
}
