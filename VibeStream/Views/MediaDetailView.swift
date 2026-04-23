//
//  MediaDetailView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/23/26.
//

import SwiftUI

struct MediaDetailView: View {
    
    let item: MediaItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(item.title)
                .font(.largeTitle)
                .bold()
            
            Text("Creator: \(item.creator)")
            
            Text("Category: \(item.category.rawValue.capitalized)")
            
            Text("Genre: \(item.genre)")
            
            Text("Year: \(String(item.year))")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}


#Preview {
    MediaDetailView(
        item: MediaItem(
            id: UUID(),
            title: "Example Movie",
            creator: "Example Director",
            category: .movie,
            genre: "Drama",
            year: 2024,
            dateAdded: Date()
        )
    )
}
