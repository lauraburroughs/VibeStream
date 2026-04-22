//
//  MediaLibraryView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/22/26.
//

import SwiftUI

struct MediaLibraryView: View {
    
    @StateObject var viewModel = MediaLibraryViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                Text(item.title)
            }
            .navigationTitle("VibeStream")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // we will wire navigation next step
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}


#Preview {
    MediaLibraryView()
}
