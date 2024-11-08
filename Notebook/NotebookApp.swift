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
        // Injects the SwiftData model to the root of the app
        .modelContainer(for: Note.self)
    }
}
