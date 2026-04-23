//
//  MediaLibraryView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/22/26.
//

import SwiftUI

struct MediaLibraryView: View {
    
    @StateObject var viewModel = MediaLibraryViewModel()
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack {
            
            Group {
                if viewModel.items.isEmpty {
                    VStack(spacing: 12) {
                        Text("No media added yet")
                            .font(.headline)
                        
                        Text("Tap + to add your first item")
                            .foregroundStyle(.secondary)
                    }
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.headline)
                                
                                Text(item.creator)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                                Text(item.category.rawValue.capitalized)
                                    .font(.caption)
                                    .foregroundStyle(.blue)
                            }
                        }
                        .onDelete(perform: viewModel.deleteItem)
                    }
                }
            }
            .navigationTitle("VibeStream")
            .toolbar {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddView) {
            AddEditMediaView(viewModel: viewModel)
        }
    }
}

#Preview {
    MediaLibraryView()
}
