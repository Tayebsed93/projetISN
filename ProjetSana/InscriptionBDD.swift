//
//  InscriptionBDD.swift
//  ProjetSana
//
//

//
//  InscriptionVCHelper.swift
//  MyCoreDataApplication
//
//  Created by Tayeb Sedraia on 09/12/2016.
//  Copyright © 2016 Digipolitan. All rights reserved.
//

import UIKit

import CoreData

extension InscriptionVC {
    
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
    
    func setupData(_nom: String, _prenom: String, _mdp: String) {
        
        //clearData()
        
        
        if let context = DataManager.shared.objectContext {
            
            
            let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            user.nom = _nom
            user.prenom = _prenom
            user.motdepasse = _mdp
            
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        loadData()
        
    }
    
    
    func loadData() {
        
        if let context = DataManager.shared.objectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            do {
                
                users = try(context.fetch(fetchRequest)) as? [User]
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func loadDataUserCurrent() {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "nom == %@ AND prenom == %@ AND motdepasse == %@", nomTxt.text!, PrenomTxt.text!, MdpTxt.text!)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
            
            fetchRequest.predicate = predicate
            do {
                
                users = try(context.fetch(fetchRequest)) as? [User]
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
}








