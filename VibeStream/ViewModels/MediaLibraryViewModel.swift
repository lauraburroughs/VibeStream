//
//  MediaLibraryViewModel.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/22/26.
//

import Foundation
import SwiftUI
import Combine


class MediaLibraryViewModel: ObservableObject {
    
    @Published var items: [MediaItem] = []
    
    
    func addItem(title: String, creator: String, category: MediaCategory, genre: String, year: Int) {
        
        let newItem = MediaItem(
            id: UUID(),
            title: title,
            creator: creator,
            category: category,
            genre: genre,
            year: year,
            dateAdded: Date()
        )
        
        items.append(newItem)
    }
    
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
    func updateItem(_ updatedItem: MediaItem) {
        if let index = items.firstIndex(where: { $0.id == updatedItem.id }) {
            items[index] = updatedItem
        }
    }
    
    
}


