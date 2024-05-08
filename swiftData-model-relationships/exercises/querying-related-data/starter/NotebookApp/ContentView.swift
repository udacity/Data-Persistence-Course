//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var notes: [Note]
    @Environment(\.modelContext) var context
    // Add a State property for selectedTag

    var body: some View {
        NavigationView {
            VStack {
                // Add a picker to filter notes by tag

                List {
                    ForEach(filteredNotes) { note in
                        NoteSummary(note: .constant(note))
                    }
                }
            }
        }
    }

    var availableTags: [Tag] {
        // Implement and return only the tags associated with a note. Use the notes array for it.
    }

    var filteredNotes: [Note] {
        notes.filter { note in
            selectedTag == nil || note.tag == selectedTag
        }
    }
}

#Preview {
    ContentView()
}
