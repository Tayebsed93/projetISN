//
//  InscriptionVC
//  ProjetSana
//
//  Created by Tayeb Sedraia on 16/04/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class InscriptionVC: UIViewController {
    
    var eleves: [Eleve]?
    var users: [User]?
    var exist: Bool = false
    
    @IBOutlet weak var nomTxt: UITextField!
    @IBOutlet weak var PrenomTxt: UITextField!
    @IBOutlet weak var MdpTxt: UITextField!
    @IBOutlet weak var ConfirmeMdpTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Recuperer Donnée de la BDD
        //loadData()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //passworkTxt.resignFirstResponder()
        view.endEditing(true)
    }
    
    @IBAction func btnInscrire(_ sender: Any) {
        
        
        someLabel: if (verifieUserExiste() == true) {

            break someLabel
        }
        else if (nomTxt.text != "" && PrenomTxt.text != "" && MdpTxt.text != "" && ConfirmeMdpTxt.text != "" && MdpTxt.text == ConfirmeMdpTxt.text ) {
            
            setupData(_nom: nomTxt.text!, _prenom: PrenomTxt.text!, _mdp: MdpTxt.text!)
            let alert = UIAlertView()
            alert.title = "Bonjour"
            alert.message = "Inscription effectué avec succès"
            alert.addButton(withTitle: "OK")
            alert.show()
            
            videField()
            
            self.dismiss(animated: true, completion: nil)
        }
        else {
            inscriptionFailed()
        }
        
    }

    
    func videField() {
        
        nomTxt.text = ""
        PrenomTxt.text = ""
        MdpTxt.text = ""
        ConfirmeMdpTxt.text = ""
    }
    
    func inscriptionFailed() {
        let alert = UIAlertView()
        alert.title = "Erreur"
        alert.message = "Veuillez remplir tous les champs ou verifier que vos mot de passe sont identiques."
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    func userExistFailed() {
        let alert = UIAlertView()
        alert.title = "Erreur"
        alert.message = "Un membre existe déjà avec les données que vous avez entré. Veuillez modifier le nom et le mot de passe."
        alert.addButton(withTitle: "OK")
        alert.show()
    }

    
    //Appuie sur le bouton Annuler
    @IBAction func AnnulerClick(_ sender: Any) {
        //Appuie sur le bouton Cancel
            self.dismiss(animated: true, completion: nil)
        
    }
    
    func verifieUserExiste() -> Bool {
        loadDataUserCurrent()
        print("NB", users?.count)
        if ((users?.count)! == 0) {
            exist = false
        }
        else {
            userExistFailed()
            exist = true
        }
        
        print("Exite : ", exist)
        return exist
    }
    
    
}


