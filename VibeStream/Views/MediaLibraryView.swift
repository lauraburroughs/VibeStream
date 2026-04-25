import SwiftUI

struct MediaLibraryView: View {
    
    @StateObject var viewModel = MediaLibraryViewModel()
    @State private var showAddView = false
    @State private var searchText = ""
    @State private var sortOption: SortOption = .title
    
    private func delete(_ item: MediaItem) {
        viewModel.deleteItem(item)
    }
    
    private var filteredItems: [MediaItem] {
        let filtered = viewModel.items.filter {
            searchText.isEmpty ||
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.creator.localizedCaseInsensitiveContains(searchText)
        }
        
        switch sortOption {
        case .title:
            return filtered.sorted { $0.title < $1.title }
        case .year:
            return filtered.sorted { $0.year < $1.year }
        case .category:
            return filtered.sorted { $0.category.rawValue < $1.category.rawValue }
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
    
    enum SortOption: String, CaseIterable {
        case title = "Title"
        case year = "Year"
        case category = "Category"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                if filteredItems.isEmpty {
                    VStack(spacing: 12) {
                        Text(viewModel.items.isEmpty ? "No media added yet" : "No results found")
                            .font(.headline)
                        
                        Text(viewModel.items.isEmpty
                             ? "Tap + to add your first item"
                             : "Try adjusting your search")
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
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
            }
            .searchable(text: $searchText)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    headerView
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Button(option.rawValue) {
                                sortOption = option
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }
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
