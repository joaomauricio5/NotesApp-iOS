//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Joao Mauricio on 09/04/2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var notes = Note.testNotes
    
    func add(note: Note) {
        notes.append(note)
    }
    
    func handleDelete (at indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
    
    private var notesFile: URL {
        let documentsDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentsDirectory.appendingPathComponent("notes").appendingPathExtension(for: .json)
    }
    
    func save() throws {
        let data = try JSONEncoder().encode(notes)
        try data.write(to: notesFile)
    }
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: notesFile.path) else {return}
        let data = try Data(contentsOf: notesFile)
        notes = try JSONDecoder().decode([Note].self, from: data)
    }
}
