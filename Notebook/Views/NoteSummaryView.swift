//
//  NoteSummaryView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI

struct NoteSummaryView: View {
    var note: Note
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text(note.title)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text(note.body)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }
}

#Preview {
    NoteSummaryView(note: Note(
        title: "Note Title",
        body: "Note Body",
        date: .now
    ))
}
