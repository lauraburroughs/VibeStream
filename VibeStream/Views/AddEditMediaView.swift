//
//  AddEditMediaView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/23/26.
//

import SwiftUI

struct AddEditMediaView: View {
    
    @State private var title = ""
    @State private var creator = ""
    @State private var category: MediaCategory = .movie
    @State private var genre = ""
    @State private var year = ""
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: MediaLibraryViewModel
    
    var body: some View {
        Text("Add Media View")
    }
}
    







#Preview {
    AddEditMediaView(viewModel: MediaLibraryViewModel())
}
