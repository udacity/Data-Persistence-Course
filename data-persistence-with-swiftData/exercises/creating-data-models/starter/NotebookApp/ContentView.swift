//
//  ContentView.swift
//  NotebookApp
//

import SwiftUI

struct ContentView: View {
    // Change the notes property from a @State variable to a @Query
      @State private var notes = [
          Note(title: "Sample Note", body: "This is an example note.")
      ]
      // TODO: Add an @Environment variable named context to reference the modelContext.
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
          // Modify the addNote() function to utilize the insert() method on the context for adding new notes.
          notes.append(Note(title: "New Note", body: "Details..."))
      }
}

#Preview {
      ContentView()
}

