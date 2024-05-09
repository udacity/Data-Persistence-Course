//
//  Note.swift
//  NotebookApp
//
//  Created by V Scarlata on 5/3/24.
//

import Foundation
// Import SwiftData instead Observation
import Observation

// Define the Note class as a final class and apply the @Model macro.
@Observable
class Note: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
