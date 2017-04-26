//
//  ConnexionVC.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 19/02/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation

import CoreData

extension ConnexionVC {
    
    
    
    func loadData() {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "motdepasse == %@ AND nom == %@", txtMdp.text!, txtNom.text!)
            print("Nom : ", txtNom.text!)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
            
            fetchRequest.predicate = predicate
            do {
                
                users = try(context.fetch(fetchRequest)) as? [User]
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func loadAllUser() {
        
        if let context = DataManager.shared.objectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            do {
                
                users = try(context.fetch(fetchRequest)) as? [User]
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    
    func clearData() {
        
        if let context = DataManager.shared.objectContext {
            
            do {
                
                let entityNames = ["User"]
                
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
    
    
}








