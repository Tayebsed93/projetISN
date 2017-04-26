//
//  User+CoreDataProperties.swift
//  ProjetSana
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var motdepasse: String?
    @NSManaged public var nom: String?
    @NSManaged public var prenom: String?
    @NSManaged public var eleves: NSSet?

}

// MARK: Generated accessors for eleves
extension User {

    @objc(addElevesObject:)
    @NSManaged public func addToEleves(_ value: Eleve)

    @objc(removeElevesObject:)
    @NSManaged public func removeFromEleves(_ value: Eleve)

    @objc(addEleves:)
    @NSManaged public func addToEleves(_ values: NSSet)

    @objc(removeEleves:)
    @NSManaged public func removeFromEleves(_ values: NSSet)

}
