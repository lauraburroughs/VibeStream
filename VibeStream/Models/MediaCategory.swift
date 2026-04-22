//
//  MediaCategory.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/22/26.
//

import Foundation


enum MediaCategory: String, CaseIterable, Codable {
    case movie
    case book
    case album
    
    var displayName: String {
        rawValue.capitalized
    }
    
}


