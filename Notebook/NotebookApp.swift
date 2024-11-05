//
//  NotebookApp.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI
import SwiftData

@main
struct NotebookApp: App {
    var body: some Scene {
        WindowGroup {
            NoteListView()
        }
        .modelContainer(for: Note.self)
    }
}
