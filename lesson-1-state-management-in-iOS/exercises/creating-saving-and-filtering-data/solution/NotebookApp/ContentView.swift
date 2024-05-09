//
//  ContentView.swift
//  NotebookApp
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [
        Note(title: "Sample Note", body: "This is an example note.")
    ]
    @State private var searchText = ""

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
                Button(action: addNote) {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }
    }

    var filteredNotes: [Note] {
        notes.filter { note in
            searchText.isEmpty || note.title.lowercased().contains(searchText.lowercased())
        }
    }

    private func addNote() {
        notes.append(Note(title: "New Note", body: "Details..."))
    }
}

#Preview {
    ContentView()
}
