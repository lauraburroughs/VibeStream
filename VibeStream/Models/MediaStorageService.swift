//
//  MediaStorageService.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/25/26.
//

import Foundation

struct MediaStorageService {

    private static let fileName = "media_items.json"

    private static var fileURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent(fileName)
    }

    static func save(_ items: [MediaItem]) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save items:", error)
        }
    }

    static func load() -> [MediaItem] {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([MediaItem].self, from: data)
        } catch {
            return []
        }
    }
}
