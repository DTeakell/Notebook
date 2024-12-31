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
    @State var searchText: String = ""
    @State private var isShowingCreateFolderView: Bool = false
    
    // Injects the model into the view from the root
    @Environment(\.modelContext) var context
    
    // Reads the list
    @Query var notes: [Note]
    @Query var folders: [Folder]
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return notes
        } else {
            return notes.filter {($0.title.contains(searchText)) || ($0.body.contains(searchText))
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            // View if notes list is empty
            if notes.isEmpty {
                NoNotesView()
                    .navigationTitle("Notebook")
                
                Button {
                    isShowingNoteDetailView.toggle()
                } label: {
                    Label("Add Note", systemImage: "plus")
                        .fontWeight(.medium)
                        .foregroundStyle(.background)
                }
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            }
            
            // View for if list is not empty
            else {
                List {
                    // Folders section
                    Section("Folders") {
                        ForEach(folders) { folder in
                            NavigationLink(destination: FolderSummaryView(folder: folder)) {
                                FolderSummaryView(folder: folder)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    withAnimation {
                                        removeFolder(folder)
                                    }
                                } label: {
                                    Label("Remove Note", systemImage: "trash")
                                        .tint(.red)
                                }
                            }
                        }
                    }
                    
                    // Notes section
                    Section("All Notes") {
                        ForEach(filteredNotes) { note in
                            NavigationLink(destination: NoteDetailView(note: note)) {
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
                    }
                }
                .searchable(text: $searchText)
                .overlay {
                    if filteredNotes.isEmpty {
                        ContentUnavailableView.search
                    }
                }
                // Button to add new note
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Button { isShowingNoteDetailView = true } label: {
                                Label("New Note", systemImage: "note.text.badge.plus")
                            }
                            
                            Button { isShowingCreateFolderView = true } label: {
                                Label(
                                    "New Folder",
                                    systemImage: "folder.badge.plus"
                                )
                            }
                        } label: {
                            Label("Menu", systemImage: "plus")
                        }
                    }
                }
                .navigationTitle("Notebook")
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                .sheet(isPresented: $isShowingCreateFolderView) {
                    CreateFolderView(folder: Folder(name: "", notes: []))
                }
            }
        }
        .tint(.mint)
    }
    // Function to remove note
    private func removeNote(_ note: Note) {
        context.delete(note)
    }
    
    private func removeFolder(_ folder: Folder) {
        context.delete(folder)
    }
}

#Preview {
    NoteListView()
}
