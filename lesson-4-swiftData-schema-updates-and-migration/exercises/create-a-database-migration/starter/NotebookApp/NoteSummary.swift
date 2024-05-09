//
//  NoteSummary.swift
//  NotebookApp
//
//  Created by V Scarlata on 5/3/24.
//

import SwiftUI

struct NoteSummary: View {
    @Binding var note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .fontWeight(.bold)
            Text(note.body)
                .lineLimit(2)
            // Add a Text view to display the Priority value with caption font and gray color
        }
        .padding()
        .background(Color.clear)
        .cornerRadius(10)
    }
}

#Preview {
    NoteSummary(note: .constant(Note(title: "My Note", body: "This is a note I wrote")))
}

