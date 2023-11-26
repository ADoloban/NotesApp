//
//  NoteEntity+CoreDataProperties.swift
//  NotesApp
//
//  Created by Artem Doloban on 23.11.2023.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var imageUrl: URL?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension NoteEntity : Identifiable {

}
