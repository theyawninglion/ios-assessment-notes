//
//  NotesViewController.swift
//  Notes
//
//  Created by Taylor Phillips on 4/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        notesTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let note = notesTextView.text else { return }
        NoteController.shared.create(note: note)
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    var note: Note? 
    
    
    func updateViews() {
        guard let note = note else { return }
        notesTextView.text = note.note
    }
}
