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
    
    static func format(timeStamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let formatterString = dateFormatter.string(from: date)
        return formatterString
    }
    
    static let sampleResponse = """
        {
          "hits": [
            {
              "created_at": "2015-01-30T14:39:39.000Z",
              "title": "Cultivated Disinterest in Professional Sports",
              "url": "http://mako.cc/copyrighteous/cultivated-disinterest-in-professional-sports",
              "author": "luu",
              "points": 344,
              "story_text": "",
              "comment_text": null,
              "num_comments": 488,
              "story_id": null,
              "story_title": null,
              "story_url": null,
              "parent_id": null,
              "created_at_i": 1422628779,
              "relevancy_score": 5821,
              "_tags": [
                "story",
                "author_luu",
                "story_8972179"
              ],
              "objectID": "8972179",
              "_highlightResult": {
                "title": {
                  "value": "Cultivated Disinterest in Professional <em>Sports</em>",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "url": {
                  "value": "http://mako.cc/copyrighteous/cultivated-disinterest-in-professional-<em>sports</em>",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "author": {
                  "value": "luu",
                  "matchLevel": "none",
                  "matchedWords": []
                },
                "story_text": {
                  "value": "",
                  "matchLevel": "none",
                  "matchedWords": []
                }
              }
            },
            {
              "created_at": "2018-07-15T16:54:36.000Z",
              "title": "When You Watch Sports, Your Brain Thinks You’re Playing",
              "url": "http://nautil.us/issue/39/sport/the-unique-neurology-of-the-sports-fans-brain",
              "author": "prostoalex",
              "points": 338,
              "story_text": null,
              "comment_text": null,
              "num_comments": 155,
              "story_id": null,
              "story_title": null,
              "story_url": null,
              "parent_id": null,
              "created_at_i": 1531673676,
              "relevancy_score": 8240,
              "_tags": [
                "story",
                "author_prostoalex",
                "story_17535995"
              ],
              "objectID": "17535995",
              "_highlightResult": {
                "title": {
                  "value": "When You Watch <em>Sports</em>, Your Brain Thinks You’re Playing",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "url": {
                  "value": "http://nautil.us/issue/39/sport/the-unique-neurology-of-the-<em>sports</em>-fans-brain",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "author": {
                  "value": "prostoalex",
                  "matchLevel": "none",
                  "matchedWords": []
                }
              }
            },
            {
              "created_at": "2021-07-08T13:34:27.000Z",
              "title": "Sports Owners Use Their Teams to Avoid Millions in Taxes",
              "url": "https://www.propublica.org/article/the-billionaire-playbook-how-sports-owners-use-their-teams-to-avoid-millions-in-taxes",
              "author": "danso",
              "points": 262,
              "story_text": null,
              "comment_text": null,
              "num_comments": 224,
              "story_id": null,
              "story_title": null,
              "story_url": null,
              "parent_id": null,
              "created_at_i": 1625751267,
              "_tags": [
                "story",
                "author_danso",
                "story_27771753"
              ],
              "objectID": "27771753",
              "_highlightResult": {
                "title": {
                  "value": "<em>Sports</em> Owners Use Their Teams to Avoid Millions in Taxes",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "url": {
                  "value": "https://www.propublica.org/article/the-billionaire-playbook-how-<em>sports</em>-owners-use-their-teams-to-avoid-millions-in-taxes",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "author": {
                  "value": "danso",
                  "matchLevel": "none",
                  "matchedWords": []
                }
              }
            },
            {
              "created_at": "2017-10-21T19:28:11.000Z",
              "title": "Beating the bookies – how the online sports betting market is rigged",
              "url": "https://arxiv.org/abs/1710.02824",
              "author": "zeristor",
              "points": 242,
              "story_text": null,
              "comment_text": null,
              "num_comments": 155,
              "story_id": null,
              "story_title": null,
              "story_url": null,
              "parent_id": null,
              "created_at_i": 1508614091,
              "relevancy_score": 7728,
              "_tags": [
                "story",
                "author_zeristor",
                "story_15523186"
              ],
              "objectID": "15523186",
              "_highlightResult": {
                "title": {
                  "value": "Beating the bookies – how the online <em>sports</em> betting market is rigged",
                  "matchLevel": "full",
                  "fullyHighlighted": false,
                  "matchedWords": [
                    "sports"
                  ]
                },
                "url": {
                  "value": "https://arxiv.org/abs/1710.02824",
                  "matchLevel": "none",
                  "matchedWords": []
                },
                "author": {
                  "value": "zeristor",
                  "matchLevel": "none",
                  "matchedWords": []
                }
              }
            }
          ],
          "nbHits": 42338,
          "page": 0,
          "nbPages": 50,
          "hitsPerPage": 20,
          "exhaustiveNbHits": false,
          "query": "<sports",
          "params": "advancedSyntax=true&analytics=true&analyticsTags=backend&query=%3Csports",
          "processingTimeMS": 3
        }
        """

}
