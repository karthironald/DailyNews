//
//  NewsRowViewModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation

class NewsRowViewModel: NSObject {
    
    var news: Hit
    
    // MARK: - Init Methods
    
    init(news: Hit) {
        self.news = news
    }
    
}
