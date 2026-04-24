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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(30)
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
            dateAdded: Date()
        )
    )
}
