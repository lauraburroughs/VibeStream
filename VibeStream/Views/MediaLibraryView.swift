import SwiftUI

struct MediaLibraryView: View {
    
    @StateObject var viewModel = MediaLibraryViewModel()
    @State private var showAddView = false
    @State private var searchText = ""
    
    private func delete(_ item: MediaItem) {
        if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
            viewModel.items.remove(at: index)
        }
    }
    
    private var filteredItems: [MediaItem] {
        if searchText.isEmpty {
            return viewModel.items
        } else {
            return viewModel.items.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.creator.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 10) {
            Image("VibeStreamLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text("VibeStream")
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                if viewModel.items.isEmpty {
                    VStack(spacing: 12) {
                        Text("No media added yet")
                            .font(.headline)
                        
                        Text("Tap + to add your first item")
                            .foregroundStyle(.secondary)
                    }
                } else {
                    List {
                        ForEach(filteredItems) { item in
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
                    .searchable(text: $searchText)
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    headerView
                }
                
                ToolbarItem(placement: .topBarTrailing) {
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
}
