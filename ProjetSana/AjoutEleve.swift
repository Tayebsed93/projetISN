//
//  AjoutEleve.swift
//  ProjetSana
//
//

import UIKit

class AjoutEleve: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var eleves: [Eleve]?
    var user: User?
    var userCurrent: User?
    var usersCurrent: [User]?
    var users: [User]?
    
    var type = ["1 ES", "1 L", "1 S", "1 STMG", "T ES", "T L", "T S", "T STMG"]
    var selectionclass = "1 ES"
    
    var valueVue = "Bonne"
    var valueBavarde = "Oui"
    
    var passmotdepasse = String()
    var passnom = String()
    
    
    
    
    
    @IBOutlet weak var choixClasse: UIPickerView!
    
    
    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtPrenom: UITextField!
    
    @IBOutlet weak var imageEleve: UIImageView!
    
    @IBOutlet weak var ControllerBavarde: UISegmentedControl!
    @IBOutlet weak var ControllerVue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choixClasse.delegate = self
        
        //Recuperer Donnée de la BDD
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    ///////////////**
    //PickerView
    ///////////////**
    
    //Nombre d'élément dans le tableau
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionclass = type[row]
        print(selectionclass)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //Appuie sur le bouton Cancel
    @IBAction func cancelButtonTouche(_ sender: Any) {
                self.dismiss(animated: true, completion: nil)
    }
    
    //Clique sur le bouton ajouter photo
    @IBAction func ajouterPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let picker = UIImagePickerController()
            
            
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
            
        } else {
            print("Erreur")
        }
    }
    
    
    //Enleve le clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //passworkTxt.resignFirstResponder()
        view.endEditing(true)
    }
    
    //Fonction qui récupère l'image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {

            self.imageEleve.image = image
        }
        picker.dismiss(animated: true)
    }
    
    @IBAction func ChangeControllerBavarde(_ sender: Any) {
        
        if ControllerBavarde.selectedSegmentIndex == 0 {
            valueBavarde = "Oui"
            
        }
        
        if ControllerBavarde.selectedSegmentIndex == 1 {
            valueBavarde = "Non"
        }
        
        print(valueBavarde)
    }
    
    @IBAction func ChangeControllerVue(_ sender: Any) {
        
        if ControllerVue.selectedSegmentIndex == 0 {
            valueVue = "Bonne"
        }
        
        if ControllerBavarde.selectedSegmentIndex == 1 {
            valueVue = "Mauvaise"
        }
    }
    
    
    @IBAction func saveBoutton(_ sender: Any) {
        //De NS data en UIMAGE
        //let mainImage = UIImage(data: profileImageName as! Data)
        var photo: NSData? = nil
        if self.imageEleve.image != nil {
            photo = (UIImagePNGRepresentation(self.imageEleve.image!) as NSData?)!
            setupData(_name: txtNom.text!, _prenom: txtPrenom.text!, _etude: selectionclass, _photo: photo!, _vue: valueVue, _bavarde: valueBavarde)
        }
        else {
            ajoutFailed()
        }
        //let photo = UIImagePNGRepresentation(self.imageEleve.image!) as NSData?
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func ajoutFailed() {
        let alert = UIAlertView()
        alert.title = "Erreur"
        alert.message = "Echec de l'ajout. Veuillez ajouter une photo à l'élève."
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    
    
}

