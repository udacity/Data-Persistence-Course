//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var notes: [Note]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
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

    private func addNote() {
        let newNote = Note(title: "A New Note", body: "Details...")
        context.insert(newNote)
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
