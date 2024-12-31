//
//  FolderSummaryView.swift
//  Notebook
//
//  Created by Dillon Teakell on 12/30/24.
//

import SwiftUI

struct FolderSummaryView: View {
    var folder: Folder
    var body: some View {
        HStack {
            Image(systemName: "folder.fill")
                .foregroundStyle(.mint)
            Text(folder.name)
            Spacer()
            
            Text("\(folder.notes.count)")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    FolderSummaryView(folder: Folder(name: "New Folder"))
}
