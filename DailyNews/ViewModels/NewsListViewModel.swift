//
//  NewsListViewModel.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import Foundation
import Combine

protocol NewsListViewModelProtocol {
    var news: [Hit] { get set }
    var searchText: String? { get set }
    
    func fetchNews(paginating: Bool, shouldReset: Bool)
}

class NewsListViewModel: NSObject, ObservableObject, NewsListViewModelProtocol {
    
    @Published var news: [Hit] = []    
    @Published var searchText: String?
    @Published var isFetching = true
    
    var isAllHitsFetched = false
    
    private var currentPage = -1
    private let perPage = 20
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Init Methods
    
    override init() {
        super.init()
        $searchText
            .debounce(for: .seconds(0.75), scheduler: DispatchQueue.main) // Delay API hit to handle fast user typing action
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.fetchNews(paginating: false, shouldReset: true)
            }
            .store(in: &cancellables)
    }
    
    
    // MARK: - Custom methods
    
    func fetchNews(paginating: Bool = false, shouldReset: Bool) {
        
        if shouldReset {
            currentPage = -1
        }
        
        var urlString = "https://hn.algolia.com/api/v1/search?hitsPerPage=\(perPage)"
        if let searchText = searchText?.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), !searchText.isEmpty {
            currentPage += 1
            urlString.append("&query=\(searchText)&page=\(currentPage)")
        } else { // For any invalid search text, fetch default news list
            currentPage = paginating ? currentPage + 1 : 0
            urlString.append("&page=\(currentPage)")
        }
        
        guard let url = URL(string: urlString) else { return }
        
        isFetching = true
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .catch { _ in Just(NewsResponse(hits: [], nbHits: nil, page: nil, nbPages: nil, hitsPerPage: nil, exhaustiveNbHits: nil, query: nil, params: nil, processingTimeMS: nil)) }
            .sink { [weak self] in
                guard let self = self else { return }
                self.isFetching = false
                if paginating && !shouldReset {
                    self.news.append(contentsOf: $0.hits)
                } else {
                    self.news = $0.hits
                }
                
                // Check whether all data is fetched or not
                self.isAllHitsFetched = ($0.hits.count < self.perPage)
            }
            .store(in: &cancellables)
    }
    
}
