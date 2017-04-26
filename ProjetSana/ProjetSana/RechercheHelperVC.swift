//
//  RechercheHelperVC.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 03/04/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation

import CoreData

extension RechercheVC {
    
    func clearData() {
        
        if let context = DataManager.shared.objectContext {
            
            do {
                
                let entityNames = ["Eleve"]
                
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    
                    for object in objects! {
                        context.delete(object)
                    }
                }
                
                try(context.save())
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func setupData() {
        
        clearData()
        
        if let context = DataManager.shared.objectContext {
            
            let eleve1 = NSEntityDescription.insertNewObject(forEntityName: "Eleve", into: context) as! Eleve
            eleve1.name = "Sedraia"
            eleve1.prenom = "Sana"
            eleve1.etude = "1ère S"
            //eleve1.photo = UIImage(data: profileImageName as! Data)
            
            let eleve2 = NSEntityDescription.insertNewObject(forEntityName: "Eleve", into: context) as! Eleve
            eleve2.name = "Sedraia"
            eleve2.prenom = "Tayeb"
            eleve2.etude = "Master"
            //eleve1.photo = UIImage(data: profileImageName as! Data)
            
            
            
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        //loadData()
        
    }
    
    
    func loadData(_cleRecherche: String) {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            ///Ajouter
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "etude == %@", _cleRecherche)
            
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









