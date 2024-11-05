//
//  NoNotesView.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import SwiftUI

struct NoNotesView: View {
    var body: some View {
            VStack {
                Image(systemName: "note")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.purple)
                
                Text("No Notes")
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text("Add notes to your notebook to get started!")
                    .font(.body)
                    .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    NoNotesView()
}
