//
//  ViewController.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 19/02/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import UIKit
import AVFoundation

class Accueil: UITableViewController {

    var eleves: [Eleve]?
    var user: User?
    var nb: Int = 0
    
    var passmotdepasse = String()
    var passnom = String()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        print(FileManager.documentURL()!)
        if let context = DataManager.shared.objectContext {
            print(context)
        }
        //Recuperer Donnée de la BDD
        loadData()

        self.title = "Bonjour " + passnom
        self.tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
 

        return (eleves?.count)!

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        
        var mainImageView = cell?.viewWithTag(1) as! UIImageView
        
        //Test si l'objet n'est pas null
        if let profileImageName = eleves?[indexPath.row].photo {
            let mainImage = UIImage(data: profileImageName as! Data)
            mainImageView.image = mainImage
        }
        else{
            mainImageView.image = UIImage(named: "profile")
        }
        
        
        // Nom de famille de l'élève
        let labelName = cell?.viewWithTag(2) as! UILabel
        labelName.text = eleves?[indexPath.row].name

        
        //Prenom de l'élève
        let labelPrenom = cell?.viewWithTag(3) as! UILabel
        labelPrenom.text = eleves?[indexPath.row].prenom
        
        
        //Classe de l'élève
        let labelClasse = cell?.viewWithTag(4) as! UILabel
        labelClasse.text = eleves?[indexPath.row].etude
        
        return cell!
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Suprimer") { (action, indexPath) in
            print("Suprime", indexPath)
            
            
             let img = self.eleves?[indexPath.row].photo
             
             
             // Nom de famille de l'élève
             let labelName = self.eleves?[indexPath.row].name
             
             //Prénom de l'élève
             let labelPrenom = self.eleves?[indexPath.row].prenom
             
             //Classe de l'élève
             let labelEtude = self.eleves?[indexPath.row].etude
            
            self.supprimer(_cleEtude: labelEtude!, _cleName: labelName!, _clePrenom: labelPrenom!)
            
            
            self.tableView.reloadData()
            
        }
        
        //self.tableView.reloadData()
        return [delete]
    }
    

    @IBAction func PlusClick(_ sender: Any) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navigation_ajout_eleve") as! UINavigationController
        
        
        //Convertie la UINavigationController en UIViewController (Acceuil)
        let ajoutEleveController = navigation.topViewController as? AjoutEleve
        
        //Envoie le nom et le mot de passe à la page ajoutEleve
        ajoutEleveController?.passnom = self.passnom
        ajoutEleveController?.passmotdepasse = self.passmotdepasse
        print("Plus click passmot de passe ", self.passmotdepasse)
        
        //Change la page vers l'acceuil
        self.present(navigation, animated: true, completion: nil)
    }
    
    @IBAction func DeconnexionClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

