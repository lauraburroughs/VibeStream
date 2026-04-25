//
//  AddEditMediaView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/23/26.
//

import SwiftUI

struct AddEditMediaView: View {
    
    @State private var title = ""
    @State private var creator = ""
    @State private var category: MediaCategory = .movie
    @State private var genre = ""
    @State private var year = ""
    @State private var rating = 0

    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: MediaLibraryViewModel
    let existingItem: MediaItem?
    
    init(viewModel: MediaLibraryViewModel, existingItem: MediaItem? = nil) {
        self.viewModel = viewModel
        self.existingItem = existingItem
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {
                TextField("Title", text: $title)
                TextField("Creator", text: $creator)
            }
            
            Section(header: Text("Category")) {
                Picker("Type", selection: $category) {
                    ForEach(MediaCategory.allCases, id: \.self) {
                        item in Text(item.rawValue.capitalized)
                    }
                }
            }
            
            Section(header: Text("Details")) {
                TextField("Genre", text: $genre)
                TextField("Year", text: $year)
                    .keyboardType(.numberPad)
                    .onChange(of: year) {
                        year = year.filter { $0.isNumber }
                    }
            }
            
            Section(header: Text("Rating")) {
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= rating ? "star.fill" : "star")
                            .foregroundStyle(.yellow)
                            .onTapGesture {
                                rating = star
                            }
                    }
                }
            }
            
            Section {
                Button("Save") {
                    
                    guard let yearInt = Int(year) else { return }
                    
                    let updatedItem = MediaItem(
                        id: existingItem?.id ?? UUID(),
                        title: title,
                        creator: creator,
                        category: category,
                        genre: genre,
                        year: yearInt,
                        dateAdded: existingItem?.dateAdded ?? Date(),
                        rating: rating
                    )
                    
                    if existingItem != nil {
                        viewModel.updateItem(updatedItem)
                    } else {
                        viewModel.addItem(
                            title: title,
                            creator: creator,
                            category: category,
                            genre: genre,
                            year: yearInt,
                            rating: rating
                        )
                    }
                    dismiss()
                }
            }
        }
        .onAppear {
            if let item = existingItem {
                title = item.title
                creator = item.creator
                category = item.category
                genre = item.genre
                year = String(item.year)
                rating = item.rating
            }
        }
    }
}
    


#Preview {
    AddEditMediaView(viewModel: MediaLibraryViewModel())
}
