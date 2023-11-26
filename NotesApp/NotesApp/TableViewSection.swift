//
//  TableViewSection.swift
//  NotesApp
//
//  Created by Artem Doloban on 21.11.2023.
//

import Foundation

protocol TableViewItemProtocol { }

struct TableViewSection {
    var title: String?
    var items: [TableViewItemProtocol]
}
