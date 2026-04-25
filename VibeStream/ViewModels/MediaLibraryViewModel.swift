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
    
    @Published var items: [MediaItem] = MediaStorageService.load()
    
    
    func addItem(title: String,
                 creator: String,
                 category: MediaCategory,
                 genre: String,
                 year: Int,
                 rating: Int,
                 notes: String) {
        
        let newItem = MediaItem(
            id: UUID(),
            title: title,
            creator: creator,
            category: category,
            genre: genre,
            year: year,
            dateAdded: Date(),
            rating: rating,
            notes: notes
        )
        
        items.append(newItem)
        MediaStorageService.save(items)
    }
    
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        MediaStorageService.save(items)
    }
    
    
    func deleteItem(_ item: MediaItem) {
        items.removeAll { $0.id == item.id }
        MediaStorageService.save(items)
    }
    
    
    func updateItem(_ updatedItem: MediaItem) {
        guard let index = items.firstIndex(where: { $0.id == updatedItem.id }) else { return }
        items[index] = updatedItem
        MediaStorageService.save(items)
    }
}


