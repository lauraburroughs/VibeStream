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
    
    
    private func delete(_ item: MediaItem) {
        if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
            viewModel.items.remove(at: index)
        }
    }
    
    
    
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
                            NavigationLink(
                                destination: MediaDetailView(viewModel: viewModel, item: item)
                            ) {
                                MediaRowView(item: item)
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                            }
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    delete(item)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
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
