//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var notes: [Note]
    @Environment(\.modelContext) var context
    @State private var searchText = ""
    @State private var refresh = false

    var body: some View {
        NavigationView {
            List {
                TextField("Search notes...", text: $searchText)
                ForEach(filteredNotes) { note in
                    NoteSummary(note: .constant(note))
                }
                .onDelete(perform: deleteNote)
            }
            .id(refresh)
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
        let sampleTags = NotebookContainer.sampleTags()
        let randomTagIndex = Int.random(in: 0 ..< sampleTags.count)
        let newNote = Note(title: "A New Note", body: "Details...")
        newNote.tag = sampleTags[randomTagIndex]
        context.insert(newNote)
        refresh.toggle()
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
