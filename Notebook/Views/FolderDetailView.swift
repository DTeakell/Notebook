//
//  FolderDetailView.swift
//  Notebook
//
//  Created by Dillon Teakell on 1/2/25.
//

import SwiftUI

struct FolderDetailView: View {
    var folder: Folder
    @Environment(\.modelContext) private var context
    @State private var isShowingNoteDetailView: Bool = false
    
    var body: some View {
        NavigationStack {
            // If list if empty
            if folder.notes.isEmpty {
                NoNotesInFolderView(folder: folder)
                    .navigationTitle(folder.name)
                
                Button {
                    isShowingNoteDetailView.toggle()
                } label: {
                    Label("Add Note", systemImage: "plus")
                        .fontWeight(.medium)
                }
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                .buttonStyle(.bordered)
                .padding()
            }
            
            else {
                // If list is not empty
                List {
                    ForEach(folder.notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            NoteSummaryView(note: note)
                        }
                    }
                }
                .navigationTitle(folder.name)
            }
        }
    }
}

#Preview {
    FolderDetailView(folder: Folder(name: "New Folder", notes: []))
}
