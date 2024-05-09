//
//  ContentView.swift
//  NotebookApp
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var notes: [Note]
    @Environment(\.modelContext) var context
    @State private var selectedTag: Tag?

    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter by Tag", selection: $selectedTag) {
                    Text("All Tags").tag(nil as Tag?)
                    ForEach(availableTags, id: \.self) { tag in
                        Text(tag.name).tag(tag as Tag?)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                List {
                    ForEach(filteredNotes) { note in
                        NoteSummary(note: .constant(note))
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
}

#Preview {
    ContentView()
}
