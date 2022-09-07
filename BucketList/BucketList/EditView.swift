//
//  EditView.swift
//  BucketList
//
//  Created by Alexander Ostrovsky on 04.09.2022.
//

import SwiftUI

struct EditView: View {
    
    @StateObject private var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss
    private var onSave: (Location) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    onSave(viewModel.makeUpdatedLocation())
                    dismiss()
                }
            }
        }
        .task {
            await viewModel.fetchNearbyPlaces()
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))
        self.onSave = onSave
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example, onSave: { _ in })
    }
}
