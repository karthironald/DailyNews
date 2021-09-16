//
//  NewsModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation

/// Used: https://app.quicktype.io

struct NewsResponse: Codable {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int?
    let exhaustiveNbHits: Bool?
    let query, params: String?
    let processingTimeMS: Int?
}

struct Hit: Codable {
    let createdAt, title: String?
    let url: String?
    let author: String?
    let points: Int?
    let storyText: String?
    let numComments: Int?
    let createdAtI, relevancyScore: Int?
    let tags: [String]?
    let objectID: String?
    let highlightResult: HighlightResult?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case numComments = "num_comments"
        case createdAtI = "created_at_i"
        case relevancyScore = "relevancy_score"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
}

struct HighlightResult: Codable {
    let title, url, author, storyText: Author?

    enum CodingKeys: String, CodingKey {
        case title, url, author
        case storyText = "story_text"
    }
}

struct Author: Codable {
    let value: String?
    let matchLevel: String?
    let matchedWords: [String]?
    let fullyHighlighted: Bool?
}
