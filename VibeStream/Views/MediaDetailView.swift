//
//  MediaDetailView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/23/26.
//

import SwiftUI

struct MediaDetailView: View {
    
    @ObservedObject var viewModel: MediaLibraryViewModel
    let item: MediaItem
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {

                Group {
                    Text(item.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }

                Divider()

                Group {
                    Text("Creator: \(item.creator)")
                    Text("Category: \(item.category.rawValue.capitalized)")
                    Text("Genre: \(item.genre)")
                    Text("Year: \(String(item.year))")                }
                .font(.body)

                Divider()

                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= item.rating ? "star.fill" : "star")
                            .foregroundStyle(Color.ratingStar)
                    }
                }
                
                if !item.notes.isEmpty {
                    Divider()

                    Text("Notes")
                        .font(.headline)

                    Text(item.notes)
                        .font(.body)
                }
            }
            
            .padding()
            .background(Color.detailCard)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 2)
            .padding()
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddEditMediaView(
                        viewModel: viewModel,
                        existingItem: item
                    )
                } label: {
                    Text("Edit")
                }
            }
        }
    }
}


#Preview {
    MediaDetailView(
        viewModel: MediaLibraryViewModel(),
        item: MediaItem(
            id: UUID(),
            title: "Example Movie",
            creator: "Example Director",
            category: .movie,
            genre: "Drama",
            year: 2024,
            dateAdded: Date(),
            rating: 5,
            notes: "Loved it"
        )
    )
}
