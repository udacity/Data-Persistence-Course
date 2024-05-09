//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Note.title, order: .forward) private var notes: [Note]
    @Environment(\.modelContext) var context
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                TextField("Search notes...", text: $searchText)
                ForEach(filteredNotes) { note in
                    NoteSummary(note: .constant(note))
                }
                .onDelete(perform: deleteNote)
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
        let notesPredicate = #Predicate<Note> {
            $0.title.localizedStandardContains(searchText)
        }

        let descriptor = FetchDescriptor<Note>(
            predicate: searchText.isEmpty ? nil : notesPredicate,
            sortBy: [SortDescriptor(\Note.title, order: .forward)]
        )

        do {
            let filteredNotes = try context.fetch(descriptor)
            return filteredNotes
        } catch {
            return []
        }
    }

    private func addNote() {
        context.insert(Note(title: "New Note", body: "Details..."))
    }

    private func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            let noteToDelete = notes[index]
            context.delete(noteToDelete)
        }
    }
}

#Preview {
    ContentView()
}
