//
//  PlanEleveHelp.swift
//  ProjetSana
//
//

import Foundation

import CoreData

extension PlanEleve {
    
    
    
    func loadData(_cleRecherche: String) {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            ///Ajouter
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "etude == %@ AND users.motdepasse == %@ AND users.nom == %@", _cleRecherche, passmotdepasse, passnom)
            
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Eleve")
            fetchRequest.predicate = predicate
            print(predicate.description)
            
            //fetchRequest.sortDescriptors = [] //optionally you can specify the order in which entities should ordered after fetch finishes
            
            ///Fin ajout
            do {
                
                eleves = try(context.fetch(fetchRequest)) as? [Eleve]
                print(eleves?.count)
                
                
            } catch let err {
                print(err)
            }
            
        }
    }

    
    
}









