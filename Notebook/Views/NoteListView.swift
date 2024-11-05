//
//  NoteListView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
    @State private var isShowingNoteDetailView: Bool = false
    @Environment(\.modelContext) var context
    @Query var notes: [Note]
    
    var body: some View {
        NavigationStack {
            if notes.isEmpty {
                NoNotesView()
                    .navigationTitle("Notebook")
                
                Button {
                    isShowingNoteDetailView.toggle()
                } label: {
                    Label("Add Note", systemImage: "plus")
                }
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            } else {
                List(notes) { note in
                    NavigationLink (destination: NoteDetailView(note: note)) {
                        NoteSummaryView(note: note)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(note)
                            }
                        } label: {
                            Label("Remove Note", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                }
                .sheet(isPresented: $isShowingNoteDetailView) {
                    NoteDetailView(note: Note(title: "", body: "", date: Date()))
                }
                
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
        .tint(.purple)
    }
}

#Preview {
    NoteListView()
}
