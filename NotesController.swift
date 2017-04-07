//
//  NotesController.swift
//  Notes
//
//  Created by Taylor Phillips on 4/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    static let shared = NoteController()
    var notes: [Note] = []
    private let noteDictionaryArrayKey = "notesDictionaryArray"
    var noteDictionaryArray: [[String: String]] = []
    
    //MARK: - crud
    
    //create
    func create(note: String) {
        let note = Note(note: note)
        notes.append(note)
        
        save()
    }
    //read
    init() {
        load()
    }
    
    
    //update
//    func update(note: Note) {
//    
//    save()
//    }
    
    //delete
    func delete(note: Note) {
        if let index = notes.index(of: note) {
            notes.remove(at: index)
        }
        save()
    }
    
    //save
    func save() {
        for notes in notes {
            let notesDictionary = notes.dictionaryRepresentation
            self.noteDictionaryArray.append(notesDictionary)
        }
        UserDefaults.standard.set(self.noteDictionaryArray, forKey: noteDictionaryArrayKey)
    }
    
    func load() {
        guard let notesDictionaryArray = UserDefaults.standard.value(forKey: noteDictionaryArrayKey) as? [[String: String]]else { return }
        for notesDictionary in notesDictionaryArray {
            guard let note = Note(dictionary: notesDictionary) else { return }
            self.notes.append(note)
        }
    }
}
