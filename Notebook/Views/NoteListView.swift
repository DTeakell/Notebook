//
//  NoteListView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
    
    // Property to control the sheet visibility
    @State private var isShowingNoteDetailView: Bool = false
    
    // Injects the model into the view from the root
    @Environment(\.modelContext) var context
    
    // Reads the list
    @Query var notes: [Note]
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return notes
        } else {
            return notes.filter {($0.title.contains(searchText)) || ($0.body.contains(searchText))
            }
        }
    }
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            
            // View if list is empty
            if notes.isEmpty {
                NoNotesView()
                    .navigationTitle("Notebook")
                
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
                .tint(Color.purple)
                .padding()
                
            }
            
            // View for if list is not empty
            else {
                List(filteredNotes) { note in
                    NavigationLink (destination: NoteDetailView(note: note)) {
                        NoteSummaryView(note: note)
                    }
                    
                    // Action to remove note
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                removeNote(note)
                            }
                        } label: {
                            Label("Remove Note", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                }
                .searchable(text: $searchText)
                .overlay {
                    if filteredNotes.isEmpty {
                        ContentUnavailableView.search
                    }
                }
                
                // Sheet that shows note editor for new note
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                
                // Button to add new note
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isShowingNoteDetailView.toggle()
                            
                        } label: {
                            Label("New Note", systemImage: "plus")
                        }
                        .buttonStyle(.borderedProminent)
                        .clipShape(Circle())
                    }
                }
                .navigationTitle("Notebook")
            }
        }
    }
    
    // Function to remove note
    private func removeNote(_ note: Note) {
        context.delete(note)
    }
}

#Preview {
    NoteListView()
}
