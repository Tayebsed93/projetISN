//
//  AjoutEleveBDD.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 22/02/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation

import CoreData

extension AjoutEleve {
    
    func clearDataUser() {
        
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
    
    func setupData(_name: String, _prenom: String, _etude: String, _photo: NSData, _vue: String, _bavarde: String) {
        

        //loadUser()
        loadDataUserCurrent()
        
        
        if let context = DataManager.shared.objectContext {
            

            for itemUser in usersCurrent! {
                
                print(itemUser.nom)
                print("----------------")

                userCurrent = itemUser

            }
 
      
            let eleve = NSEntityDescription.insertNewObject(forEntityName: "Eleve", into: context) as! Eleve
            eleve.users = userCurrent
            print("User mdp : ", userCurrent?.motdepasse)
            print("User nom : ", userCurrent?.nom)
            eleve.prenom = _prenom
            eleve.name = _name
            eleve.etude = _etude
            eleve.photo = _photo
            eleve.vue = _vue
            eleve.bavarde = _bavarde
            

            do {
                try(context.save())
                //eleves?.append(eleve)
            } catch let err {
                print(err)
            }
        }
        
        loadData()
        
    }
    
    
    func loadData() {
        
        if let context = DataManager.shared.objectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            do {
                
                eleves = try(context.fetch(fetchRequest)) as? [Eleve]
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    
    func loadUser() {
        
        if let context = DataManager.shared.objectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            do {
                
                users = try(context.fetch(fetchRequest)) as? [User]
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func supprimerUserCourant() {
        
        if let context = DataManager.shared.objectContext {
            
            //Avant il y avait juste ça
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Eleve")
            
            ///Ajouter
            let managedObjectContext: NSManagedObjectContext
            let predicate = NSPredicate(format: "nom == %@ AND motdepasse = %@", self.passnom, self.passmotdepasse)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
            
            fetchRequest.predicate = predicate
            
            
            do {
                
                let users = try(context.fetch(fetchRequest)) as? [User]
                
                for user in users! {
                    context.delete(user)
                }
                
                //Sauvegarder les modifications
                try(context.save())
                
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
            let predicate = NSPredicate(format: "motdepasse == %@ AND nom == %@", passmotdepasse, passnom)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
            
            fetchRequest.predicate = predicate
            do {
                
                usersCurrent = try(context.fetch(fetchRequest)) as? [User]
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
}

