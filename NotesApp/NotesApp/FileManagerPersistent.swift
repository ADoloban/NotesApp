//
//  FileManagerPersistent.swift
//  NotesApp
//
//  Created by Artem Doloban on 25.11.2023.
//

import UIKit

final class FileManagerPersistent {
    
    static func save(_ image: UIImage, with name: String) -> URL? {
        let data = image.jpegData(compressionQuality: 1)
        let url = getDocumnentDirectory().appendingPathComponent(name)
        
        do {
            try data?.write(to: url)
            print("Image was saved")
            return url
        } catch {
            print("Saving image error \(error)")
            return nil
        }
    }
    
    static func read(from url: URL) -> UIImage? {
        UIImage(contentsOfFile: url.path)
    }
    
    static func delete(from url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
            print("Image was deleted")
        } catch {
            print("Saving image error \(error)")
        }
    }
    
    private static func getDocumnentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask)[0]
    }
}
