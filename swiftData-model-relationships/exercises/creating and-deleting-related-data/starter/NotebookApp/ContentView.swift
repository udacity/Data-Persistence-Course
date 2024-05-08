//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: [SortDescriptor(\Note.title, order: .forward)], animation: .bouncy) private var notes: [Note]
    @Query private var tags: [Tag]
    @Environment(\.modelContext) var context
    @State private var selectedTag: Tag?

    var body: some View {
        NavigationView {
            VStack {
                // ONLY if availableTags is not empty, display the Picker with a segmented style
                /*
                     Picker("Filter by Tag", selection: $selectedTag) {
                         Text("All Tags").tag(nil as Tag?)
                         ForEach(availableTags, id: \.self) { tag in
                             Text(tag.name).tag(tag as Tag?)
                         }
                     }
                     .pickerStyle(.segmented)
                     .padding()
                 */

                List {
                    ForEach(filteredNotes) { note in
                        NoteSummary(note: .constant(note))
                    }
                    .onDelete(perform: deleteNote)
                }
                .toolbar {
                    Button(action: addNote) {
                        Label("Add Note", systemImage: "plus")
                    }
                }
            }
        }
    }

    var availableTags: [Tag] {
        let tagsWithNotes = notes.compactMap { $0.tag }
        return Array(Set(tagsWithNotes)).sorted { $0.name < $1.name }
    }

    var filteredNotes: [Note] {
        notes.filter { note in
            selectedTag == nil || note.tag == selectedTag
        }
    }

    private func deleteNote(at offsets: IndexSet) {
        // Implement deleteNote to remove a note from the context
    }

    private func addNote() {
        // Create a random note and insert it into the context
    }

    private func createRandomNote() -> Note {
        let sampleTitles = ["Meeting Notes",
                            "Grocery List",
                            "Workout Schedule",
                            "Project Ideas",
                            "Study Notes"]

        let sampleBodies = ["Here are some detailed notes",
                            "Important items to buy",
                            "Summary of the book",
                            "Plans for the upcoming holiday",
                            "Weekly workout regime"]

        let randomTagIndex = Int.random(in: 0 ..< tags.count)
        let randomBodyIndex = Int.random(in: 0 ..< sampleBodies.count)
        let randomTitleIndex = Int.random(in: 0 ..< sampleTitles.count)
        let title = sampleTitles[randomTitleIndex]
        let body = sampleBodies[randomBodyIndex]

        let newNote = Note(title: title, body: body)
        newNote.tag = tags[randomTagIndex]

        return newNote
    }
}

#Preview {
    ContentView()
}
