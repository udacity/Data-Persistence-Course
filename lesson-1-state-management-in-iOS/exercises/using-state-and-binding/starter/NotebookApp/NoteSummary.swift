//
//  NoteSummary.swift
//  NotebookApp
//
//  Created by V Scarlata on 5/3/24.
//

import SwiftUI

// Step 2: Update NoteSummary to accept a binding
struct NoteSummary: View {
      // Add @Binding property here for note
      // var note: Note

      var body: some View {
          VStack {
              // Add interactive TextField for note's title
              // Add interactive TextField for note's body
          }
      }
}

#Preview {
    NoteSummary(note: .constant(Note(title: "My Note", body: "This is a note I wrote")))
}
