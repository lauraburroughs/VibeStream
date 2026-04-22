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
    
    func addItem(_ item: MediaItem) {
        items.append(item)
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}


