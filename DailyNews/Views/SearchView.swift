//
//  SearchView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var showCancelButton: Bool = false
    @Binding var searchText: String
    var isFetching: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                    withAnimation {
                        self.showCancelButton = true
                    }
                })
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                ZStack {
                    if isFetching {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    } else {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText.isEmpty ? 0 : 1)
                        }
                    }
                }
                
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            if showCancelButton  {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                    self.searchText = ""
                    withAnimation {
                        self.showCancelButton = false
                    }
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""), isFetching: false)
    }
}
