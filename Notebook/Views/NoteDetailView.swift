//
//  NoteDetailView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var note: Note
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Note Title", text: $note.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                TextEditor(text: $note.body)
                    .font(.body)
            }
            .toolbar {
                
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        context.insert(note)
                        dismiss()
                    }
                    .disabled(note.title.isEmpty)
                }
            }
            .navigationBarBackButtonHidden()
            .padding()
        }
    }
}

#Preview {
    NoteDetailView(
        note: Note(title: "Note Title", body: "Note body", date: .now)
    )
}
