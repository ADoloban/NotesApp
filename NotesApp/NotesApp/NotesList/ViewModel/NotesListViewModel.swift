//
//  NotesListViewModel.swift
//  NotesApp
//
//  Created by Artem Doloban on 21.11.2023.
//

import Foundation
import UIKit

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
    var reloadTable: (() -> Void)? { get set }
    
    func getNotes()
    func getImage(for url: URL) -> UIImage?
}

final class NotesListViewModel: NotesListViewModelProtocol {
    var reloadTable: (() -> Void)?
    
    private(set) var section: [TableViewSection] = [] {
        didSet {
            reloadTable?()
        }
    }
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        let notes = NotePersistent.fetchAll()
        section = []
        
        let groupObjects = notes.reduce(into: [Date: [Note]]()) { result, note in
            let date = Calendar.current.startOfDay(for: note.date)
            result[date, default: []].append(note)
        }
        
        let keys = groupObjects.keys
        
        keys.forEach { key in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            let stringDate = dateFormatter.string(from: key)
            
            section.append(TableViewSection(title: stringDate,
                                       items: groupObjects[key] ?? []))
        }
    }
    
    func getImage(for url: URL) -> UIImage? {
        FileManagerPersistent.read(from: url)
    }
    
    private func setMocks() {
        let section = TableViewSection(title: "23 Apr 2023",
                                       items:[
                                        Note(title: "First note",
                                             description: "First note description",
                                             date: Date(),
                                             imageURL: nil),
                                        Note(title: "First note",
                                             description: "First note description",
                                             date: Date(),
                                             imageURL: nil)
                                       ])
        self.section = [section]
    }
}
