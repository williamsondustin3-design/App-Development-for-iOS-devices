//
//  ViewController.swift
//  Assignment 6
//
//  Created by  on 10/8/25.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedName = UserDefaults.standard.string(forKey: "name")
        let savedBirthday = UserDefaults.standard.string(forKey: "birthday")
        
        if let name = savedName {
            nameLabel.text = "Name: \(name)"
        }
        
        if let birthday = savedBirthday {
            birthdayLabel.text = "Birthday: \(birthday)"
        }
        
        func saveClicked(_ sender: UIButton) {
            UserDefaults.standard.set(nameTextField.text!, forKey: "name")
            UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
            nameLabel.text = "Name: \(nameTextField.text!)"
            birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        }
        
        func deleteClicked(_ sender: UIButton){
            if let _ = UserDefaults.standard.string(forKey: "name") {
                UserDefaults.standard.removeObject(forKey: "name")
            }
            if let _ = UserDefaults.standard.string(forKey: "birthday") {
                UserDefaults.standard.removeObject(forKey: "birthday")
            }
            nameLabel.text = "Name: "
            birthdayLabel.text = "Birthday: "
        }
        
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        birthdayLabel.font = UIFont.systemFont(ofSize: 30)
        nameTextField.font = UIFont.systemFont(ofSize: 25)
        birthdayTextField.font = UIFont.systemFont(ofSize: 25)
        
        nameLabel.textColor = .red
        birthdayLabel.textColor = .red
        nameTextField.textColor = .blue
        birthdayTextField.textColor = .blue
        
    }


}

