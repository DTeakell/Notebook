//
//  NoNoteSelectedView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/6/24.
//

import SwiftUI

struct NoNoteSelectedView: View {
    var body: some View {
        VStack {
            Image(systemName: "note")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(.purple)
            
            Text("No note selected")
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text("Please select a note to edit or create a new one")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NoNoteSelectedView()
}
