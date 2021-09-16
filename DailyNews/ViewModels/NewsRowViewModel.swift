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
        if let formattedTitle = news.title?.trimmingCharacters(in: .whitespacesAndNewlines), !formattedTitle.isEmpty {
            return formattedTitle
        } else {
            return "-"
        }
    }
    var wrappedDate: String {
        news.createdAt ?? "-"
    }
    
    // MARK: - Init Methods
    
    init(news: Hit) {
        self.news = news
    }
    
}
