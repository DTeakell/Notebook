//
//  Folder.swift
//  Notebook
//
//  Created by Dillon Teakell on 12/30/24.
//

import Foundation
import SwiftData

@Model
final class Folder: Hashable, Identifiable {
    var id = UUID()
    var name: String
    
    @Relationship
    var notes: [Note] = []
    
    var count: Int {
        get {
            return notes.count
        }
    }
    
    init(name: String, notes: [Note?] = []) {
        self.name = name
    }
    
    static func == (lhs: Folder, rhs: Folder) -> Bool {
        lhs.id == rhs.id
    }
}
