//
//  Note.swift
//  Notebook
//
//  Created by Dillon Teakell on 11/5/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Note: Identifiable {

    var title: String
    var body: String
    var date: Date
    
    
    init(title: String, body: String, date: Date) {
        self.title = title
        self.body = body
        self.date = date
    }
}
