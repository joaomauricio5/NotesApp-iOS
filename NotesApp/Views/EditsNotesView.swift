//
//  EditsNotesView.swift
//  NotesApp
//
//  Created by Joao Mauricio on 09/04/2022.
//

import SwiftUI

struct EditsNotesView: View {
    
    @Binding var note: Note
    
    var body: some View {
            Form{
                Section(content: {
                    TextField("Title", text: $note.title)
                },
                        header: {Text("Title")})
                
                Section(content: {
                    TextEditor(text: $note.content)
                },
                        header: {Text("Note")})
            }.navigationTitle("Edit “\(note.title)”")
        }
}

struct EditsNotesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditsNotesView(note: .constant(Note(title: "Note title", content: "Note content")))
        }
    }
}
