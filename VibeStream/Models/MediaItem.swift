//
//  MediaItem.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/22/26.
//

import Foundation


struct MediaItem: Identifiable, Codable {
    
    var id: UUID = UUID()
    var title: String
    var creator: String
    var category: MediaCategory
    var genre: String
    var year: Int
    var dateAdded: Date
    var rating: Int
    
}


