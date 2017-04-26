//
//  DataManager.swift
//  ProjetSana
//
//

import Foundation
import CoreData

class DataManager : NSObject {
    
    public static let shared = DataManager()
    
    public var objectContext: NSManagedObjectContext? = nil
    
    private override init() {
        if let modelURL = Bundle.main.url(forResource: "ProjetSana", withExtension: "momd") {
            if let model = NSManagedObjectModel(contentsOf: modelURL) {
                if let storageURL = FileManager.documentURL(childPath: "MyDatabase.db") {
                    
                    let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
                    _ = try? storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storageURL, options: nil)
                    
                    let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    context.persistentStoreCoordinator = storeCoordinator
                    self.objectContext = context
                }
            }
        }
    }
    
}
