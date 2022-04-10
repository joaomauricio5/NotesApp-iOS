//
//  Notes.swift
//  NotesApp
//
//  Created by Joao Mauricio on 09/04/2022.
//

import Foundation

struct Note: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var content: String
    
    init() {
        self.title = "Note title"
        self.content = "Note content"
    }
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    static let testNotes = [Note(title: "1st Note", content: "1st content"), Note(title: "2nd Note", content: "2nd content")]

}
