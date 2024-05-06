//
//  ContentView.swift
//  NotebookApp
//

import SwiftUI

// Step 1: Manage state in ContentView
struct ContentView: View {
      // Add @State property here for notes array
      // var notes: [Note]

      var body: some View {
          List(notes.indices, id: \.self) { index in
              NoteSummary(note: $notes[index])
          }
      }
}

#Preview {
      ContentView()
}
