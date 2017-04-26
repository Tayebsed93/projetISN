//
//  ViewControllerHelper.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 19/02/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation

import CoreData

extension Accueil {
    
    
    func supprimer(_cleEtude: String, _cleName: String, _clePrenom: String) {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            ///Ajouter
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "etude == %@ AND name = %@ AND prenom == %@", _cleEtude, _cleName, _clePrenom)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Eleve")
            
            fetchRequest.predicate = predicate
            

            do {
                
                let eleves = try(context.fetch(fetchRequest)) as? [Eleve]
                
                for eleve in eleves! {
                    context.delete(eleve)
                }
                
                //Sauvegarder les modifications
                try(context.save())
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    
    func loadData() {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            

            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "users.motdepasse == %@ AND users.nom == %@", passmotdepasse, passnom)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Eleve")
            
            fetchRequest.predicate = predicate
            do {
                
                eleves = try(context.fetch(fetchRequest)) as? [Eleve]

                
            } catch let err {
                print(err)
            }
            
        }
    }
 
    
}








