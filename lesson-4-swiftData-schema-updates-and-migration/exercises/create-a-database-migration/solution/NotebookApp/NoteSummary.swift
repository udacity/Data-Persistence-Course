//
//  NoteSummary.swift
//  NotebookApp
//
//  Created by V Scarlata on 5/3/24.
//

import SwiftUI

struct NoteSummary: View {
    @Binding var note: Note
    @State private var isEditing = false

    var body: some View {
        VStack(alignment: .leading) {
            if isEditing {
                TextField("Title", text: $note.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Body", text: $note.body)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    isEditing = false
                    hideKeyboard()
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding()
            } else {
                Text(note.title)
                    .fontWeight(.bold)
                Text(note.body)
                    .lineLimit(2)

                Text("Priority: \(note.priority.rawValue)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(isEditing ? Color.gray.opacity(0.2) : Color.clear)
        .cornerRadius(10)
        .animation(.default, value: isEditing)
        .onTapGesture(count: 2) {
            isEditing.toggle()
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    NoteSummary(note: .constant(Note(title: "My Note", body: "This is a note I wrote")))
}
