//
//  FolderDetailView.swift
//  Notebook
//
//  Created by Dillon Teakell on 12/31/24.
//

import SwiftUI

struct CreateFolderView: View {
    
    @State var folder: Folder
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Folder Name", text: $folder.name)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .navigationTitle("New Folder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        context.insert(folder)
                        print("Folder added")
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CreateFolderView(folder: Folder(name: ""))
}
