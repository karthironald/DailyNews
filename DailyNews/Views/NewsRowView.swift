//
//  NewsRowView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct NewsRowView: View {
    
    var viewModel: NewsRowViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.news.title.wrappedValue)
            if let createdI = viewModel.news.createdAtI {
                Text(Helper.format(timeStamp: TimeInterval(createdI)))
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical)
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(viewModel: NewsRowViewModel(news: Helper.fetchSampleNews().hits.first!))
    }
}
