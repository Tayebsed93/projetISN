//
//  ConnexionVC
//  ProjetSana
//
//  Created by Tayeb Sedraia on 16/04/2017.
//  Copyright © 2017 Tayeb Sedraia. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ConnexionVC: UIViewController {
    
    var eleves: [Eleve]?
    var users: [User]?
    

    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtMdp: UITextField!

    
    @IBOutlet weak var imageEleve: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clearData()
        //Recuperer Donnée de la BDD
        loadAllUser()
        
        for ok in users! {
            print("Nom ", ok.nom)
            print("Mdp ", ok.motdepasse)
            print("--------------")
        }
        
        print("NB", users?.count)
        
        //loadData()

        
        
        
        // Do any additional setup after loading the view.
    }
    
    //Enleve le clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //passworkTxt.resignFirstResponder()
        view.endEditing(true)
    }
    
    @IBAction func connecterClick(_ sender: Any) {
        
        loadData()
        print("NB", users?.count)
        if ((users?.count)! > 0) {
            passData()
            videField()
        }
        else {
            connexionFailed()
        }
        
        
    }
    
    func connexionFailed() {
        let alert = UIAlertView()
        alert.title = "Erreur"
        alert.message = "Nom ou mot de passe incorrect. Veuillez réessayer."
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    func videField() {
        
        txtNom.text = ""
        txtMdp.text = ""
    }



    func passData() {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabVc = storyboard.instantiateViewController(withIdentifier: "tbController") as! UITabBarController
        
        
        /////////****** 1er controller
        //Convertie la tabViewController en UINavigationController
        let navigation = tabVc.viewControllers?[0] as! UINavigationController

        //Convertie la UINavigationController en UIViewController (Acceuil)
        let accueilController = navigation.topViewController as? Accueil
        
        //Envoie le nom et le mot de passe à la page d'acceuil
        accueilController?.passnom = txtNom.text!
        accueilController?.passmotdepasse = txtMdp.text!
        
        
        /////////****** 2nd controller
        //Convertie la tabViewController en UINavigationController
        let navigation2 = tabVc.viewControllers?[1] as! UINavigationController
        
        //Convertie la UINavigationController en UIViewController (PlanEleve)
        let planEleveController = navigation2.topViewController as? PlanEleve
        
        //Envoie le nom et le mot de passe à la page d'acceuil
        planEleveController?.passnom = txtNom.text!
        planEleveController?.passmotdepasse = txtMdp.text!
        
        //Change la page vers l'acceuil
        self.present(tabVc, animated: true, completion: nil)


    }
    
    
    
    
}

