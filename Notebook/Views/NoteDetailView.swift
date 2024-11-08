//
//  NoteDetailView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI

struct NoteDetailView: View {
    
    // Dismisses the sheet
    @Environment(\.dismiss) var dismiss
    
    // Injects the note model from the root
    @Environment(\.modelContext) var context
    
    @State var note: Note
    var body: some View {
        NavigationStack {
            
            // Note title and body fields
            VStack {
                TextField("Note Title", text: $note.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                TextEditor(text: $note.body)
                    .font(.body)
            }
            
            // Cancel and save buttons
            .toolbar {
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addNote(note)
                        dismiss()
                    }
                    // Make the save button disabled so the user doesn't make an empty note
                    .disabled(note.title.isEmpty)
                }
            }
            
            // Hides the back button to make room for the cancel button
            .navigationBarBackButtonHidden()
            .padding()
        }
    }
    
    // Function to add note
    private func addNote(_ note: Note) {
        context.insert(note)
    }
}

#Preview {
    NoteDetailView(
        note: Note(title: "Note Title", body: "Note body", date: .now)
    )
}
