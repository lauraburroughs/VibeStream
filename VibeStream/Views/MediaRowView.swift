//
//  MediaRowView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/24/26.
//

import SwiftUI

struct MediaRowView: View {
    let item: MediaItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            Image(systemName: iconName)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.creator)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 8) {
                    Text(item.category.rawValue.capitalized)
                    Text("•")
                    Text("\(item.year)")
                }
                    
                HStack(spacing: 2) {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= item.rating ? "star.fill" : "star")
                            .font(.caption)
                    }
                }
                
                .font(.caption)
                .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
    
    private var iconName: String {
        switch item.category {
        case .movie: return "film"
        case .book: return "book"
        case .album: return "music.note"
        }
    }
}

#Preview {
    MediaRowView(
        item: MediaItem(
            id: UUID(),
            title: "Inception",
            creator: "Christopher Nolan",
            category: .movie,
            genre: "Sci-Fi",
            year: 2010,
            dateAdded: Date(),
            rating: 10
        )
    )
}
