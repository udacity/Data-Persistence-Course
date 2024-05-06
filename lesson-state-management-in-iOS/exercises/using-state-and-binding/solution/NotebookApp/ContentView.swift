//
//  ContentView.swift
//  NotebookApp
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [
        Note(title: "Sample Note", body: "This is an example note.")
    ]

    var body: some View {
        List(notes.indices, id: \.self) { index in
            NoteSummary(note: $notes[index])
        }
    }
}

#Preview {
    ContentView()
}
