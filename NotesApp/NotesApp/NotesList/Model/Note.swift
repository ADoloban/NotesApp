//
//  Note.swift
//  NotesApp
//
//  Created by Artem Doloban on 21.11.2023.
//

import Foundation

struct Note: TableViewItemProtocol {
    let title: String
    let description: String?
    let date: Date
    let imageURL: URL?
}
