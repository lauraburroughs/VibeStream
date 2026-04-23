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
        Form {
            Section(header: Text("Basic Info")) {
                
                TextField("Title", text: $title)
                TextField("Creator", text: $creator)
            }
            
            Section(header: Text("Category")) {
                
                Picker("Type", selection: $category) {
                    ForEach(MediaCategory.allCases, id: \.self) {
                        item in Text(item.rawValue.capitalized)
                    }
                }
            }
            
            
            Section(header: Text("Details")) {
                
                TextField("Genre", text: $genre)
                TextField("Year", text: $year)
                    .keyboardType(.numberPad)
                    .onChange(of: year) {
                        year = year.filter { $0.isNumber }
                    }
            }
            
            
            Section {
                Button("Save") {
                    
                    guard let yearInt = Int(year) else {
                        return
                    }
                    
                    viewModel.addItem(
                        title: title,
                        creator: creator,
                        category: category,
                        genre: genre,
                        year: yearInt
                        )
                    
                    dismiss()
                }
            }
        }
    }
}
    







#Preview {
    AddEditMediaView(viewModel: MediaLibraryViewModel())
}
