//
//  PlanEleve.swift
//  ProjetSana
//
//

import Foundation
import UIKit

class PlanEleve: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var passmotdepasse = String()
    var passnom = String()
    
   var eleves: [Eleve]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        
        //Recuperer Donnée de la BDD et affiche par classe
        self.loadData(_cleRecherche: keywords!)
        if eleves?.count == 0 {
            let alert = UIAlertController(title: "Erreur", message: "Aucune classe touvé. Veuillez réessayé à nouveau.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            searchBar.text = ""
        }

        self.searchBar.endEditing(true)
        
        self.collectionView.reloadData()
    }
    
    //Enleve le clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //passworkTxt.resignFirstResponder()
        //view.endEditing(true)
        self.searchBar.endEditing(true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(eleves?.count)
        
        //Test si l'objet n'est pas null
        
        if let lstEleves = eleves {
            return lstEleves.count
        }
        else {
            return 0
        }
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlanCell
        
/*
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 3
 */

        //Test si l'objet n'est pas null
        if let profileImageName = eleves?[indexPath.row].photo {
            let mainImage = UIImage(data: profileImageName as! Data)
            cell.imageEleve.image = mainImage
        }
        else{
            cell.imageEleve.image = UIImage(named: "profile")
        }
        
        
        // Nom de famille de l'élève
        let labelName = self.eleves?[indexPath.row].name
        
        //Prénom de l'élève
        cell.prenomLabel.text = self.eleves?[indexPath.row].prenom
        
        //Classe de l'élève
        let labelEtude = self.eleves?[indexPath.row].etude
    
        return cell
        
        
    }
    
}
