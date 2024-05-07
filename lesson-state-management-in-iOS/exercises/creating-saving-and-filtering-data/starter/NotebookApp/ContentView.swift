//
//  ContentView.swift
//  NotebookApp
//

import SwiftUI

struct ContentView: View {
    // This @State property temporarily stores notes in memory and will reset when the app restarts.
    @State private var notes = [Note(title: "Sample Note", body: "This is an example note.")]
    // Add String @State property as placeholder for search text state

    var body: some View {
        NavigationView {
            List {
                TextField("Search notes...", text: $searchText)
                ForEach(filteredNotes) { note in
                    NoteSummary(note: .constant(note))
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                // Add button to create new notes
            }
        }
    }

    // Add filteredNotes computed property here

    // Add function to add a new note here
}

#Preview {
    ContentView()
}
