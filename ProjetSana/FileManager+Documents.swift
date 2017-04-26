//
//  FileManager+Documents.swift
//  ProjetSana
//
//

import Foundation

extension FileManager {
    
    public static func documentURL() -> URL? {
        return self.documentURL(childPath: nil)
    }
    
    public static func documentURL(childPath: String?) -> URL? {
        if let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            if let path = childPath {
                return documentURL.appendingPathComponent(path)
            }
            return documentURL
        }
        return nil
    }
    
    
}
