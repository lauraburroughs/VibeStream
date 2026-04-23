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
            List(viewModel.items) { item in
                Text(item.title)
            }
            .navigationTitle("VibeStream")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddView = true
                    }) {
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


#Preview {
    MediaLibraryView()
}
