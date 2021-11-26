//
//  CreateNewUserViewController.swift
//  Christmas List App
//
//  Created by Daniel Vega on 10/24/21.
//

import UIKit

class CreateNewUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    let encoder = JSONEncoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        
        if let users = UserDefaults.standard.data(forKey: "userArray") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([User].self, from: users){
                StaticStuff.userArray = decoded
               
            }
        }
    }
    

    @IBAction func createNewUserAction(_ sender: UIButton) {
        if textFieldCheck() {
            StaticStuff.userArray.append(User(u: usernameTextField.text!, p: passwordTextField.text!))
            print(StaticStuff.userArray.count)
        }
        else{
            print(StaticStuff.userArray.count)
        }

        if let encoded = try? encoder.encode(StaticStuff.userArray) {
            
            UserDefaults.standard.set(encoded, forKey: "userArray")
        
    }
        
    }
    
    func textFieldCheck() -> Bool{
        if usernameTextField.text != "" &&  passwordTextField.text != "" && confirmTextField.text != "" {
            return true
        }
        else {
            return false
        }
    }

}
