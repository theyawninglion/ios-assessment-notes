//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Taylor Phillips on 4/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        let note = NoteController.shared.notes[indexPath.row]
        cell.textLabel?.text = note.note
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = NoteController.shared.notes[indexPath.row]
            NoteController.shared.delete(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNotes" {
            
            guard let index = tableView.indexPathForSelectedRow,
            let destination = segue.destination as? NotesViewController
            else { return }
            
            let note = NoteController.shared.notes[index.row]
            destination.note = note
        }
    }
}
