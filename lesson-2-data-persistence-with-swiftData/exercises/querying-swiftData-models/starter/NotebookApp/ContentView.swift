//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    // Modify the @Query initialization for notes property to include dynamic sorting based on the title with forward order
    @Query private var notes: [Note]
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
        
        // Implement and create a "descriptor" property as FetchDescriptor that uses a notesPredicate
        
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
