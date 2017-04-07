//
//  Notes.swift
//  Notes
//
//  Created by Taylor Phillips on 4/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let noteKey = "note"
    
    let note: String
    
    init(note: String) {
        self.note = note
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.note == rhs.note
    }
    
    var dictionaryRepresentation: [String: String] {
        let dictionary = [noteKey: note]
        return dictionary
    }
    
    init?(dictionary: [String: String]) {
        guard let note = dictionary[noteKey] else { return nil }
        self.note = note
    }
}
