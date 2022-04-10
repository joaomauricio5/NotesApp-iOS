//
//  NotesView.swift
//  NotesApp
//
//  Created by Joao Mauricio on 09/04/2022.
//

import SwiftUI

struct NotesView: View {
    
    @State private var newNote = Note()
    
    @StateObject var viewModel = ViewModel()
    
    @State private var isSheetVisible = false
    
    private func binding(for note: Note) -> Binding<Note> {
        return $viewModel.notes.first{$0.id == note.id}!
    }
    
    var body: some View {
        NavigationView{
            Form{
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: EditsNotesView(note: binding(for: note))) {
                        Text(note.title)
                    }
                }.onDelete(perform: {indexSet in viewModel.handleDelete(at: indexSet)})
            }
            .navigationTitle("My Notes")
            .toolbar {
                Button(action: {isSheetVisible = true}) {
                    Label("New note", systemImage: "plus.circle.fill").labelStyle(.titleAndIcon).font(.headline)
                }
            }
        }.sheet(isPresented: $isSheetVisible, onDismiss: {newNote = Note()} ) {
            
            NavigationView{
                EditsNotesView(note: $newNote)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: {
                                isSheetVisible = false
                            },
                                   label: {Text("Cancel")})
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: {
                                viewModel.add(note: newNote)
                                isSheetVisible = false
                            },
                                   label: {Text("Add")})
                        }
                        
                    }
            }
        }
        .onAppear{ try! viewModel.load() }
        .onChange(of: viewModel.notes) {_ in  try! viewModel.save() }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
