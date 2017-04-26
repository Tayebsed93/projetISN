//
//  RechercheVC.swift
//  ProjetSana
//
//  Created by Tayeb Sedraia on 03/04/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import UIKit
import AVFoundation


class RechercheVC: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!

    var eleves: [Eleve]?
    
    var favorites : [String] = []
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        
        self.loadData(_cleRecherche: keywords!)
        self.view.endEditing(true)
        self.tableView.reloadData()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        //eleves = []
        searchBar.text = ""
        
        self.tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Test si l'objet n'est pas null

        if let lstEleves = eleves {
            return lstEleves.count
        }
        else {
            return 0
        }
 
        
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




