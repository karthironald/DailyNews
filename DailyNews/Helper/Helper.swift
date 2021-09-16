//
//  Helper.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation
import SwiftUI

class Helper {
    
    /// For live preview
    static func fetchSampleNews() -> NewsResponse {
        do {
            if let jsonData = sampleResponse.data(using: .utf8) {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: jsonData)
                return newsResponse
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return NewsResponse(hits: [], nbHits: nil, page: nil, nbPages: nil, hitsPerPage: nil, exhaustiveNbHits: nil, query: nil, params: nil, processingTimeMS: nil)
    }
    
}
