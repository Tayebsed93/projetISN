//
//  Eleve+CoreDataProperties.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 17/04/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation
import CoreData


extension Eleve {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eleve> {
        return NSFetchRequest<Eleve>(entityName: "Eleve")
    }

    @NSManaged public var etude: String?
    @NSManaged public var name: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var prenom: String?
    @NSManaged public var bavarde: String?
    @NSManaged public var vue: String?
    @NSManaged public var users: User?

}
