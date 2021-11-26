//
//  ViewController.swift
//  Christmas List App
//
//  Created by Daniel Vega on 10/24/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        print(StaticStuff.userArray.count)
//        print(StaticStuff.userArray[0].userName)
//        print(StaticStuff.userArray[0].password)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let acontrol = UIAlertController(title: "error", message: "error in textfield syntax", preferredStyle: .alert)
        let aaction = UIAlertAction(title: "okay", style: .default, handler: nil)
        acontrol.addAction(aaction)
        
        
        let person = checkIf(userText: usernameTextField, passText: passwordTextField)
        if person.0 {
            StaticStuff.whatUser = person.1
            StaticStuff.itemArray = person.1.items
            print(StaticStuff.whatUser.userName)
            print(StaticStuff.whatUser.password)
            performSegue(withIdentifier: "toItems", sender: nil)
        }
        else{
            present(acontrol, animated: true)
        }
        return true
    }

    func checkIf(userText: UITextField, passText: UITextField) -> (Bool, User) {
        var i = 0
        while i < StaticStuff.userArray.count{
            if usernameTextField.text == StaticStuff.userArray[i].userName && passwordTextField.text == StaticStuff.userArray[i].password {
               
                return (true, StaticStuff.userArray[i])
            }
            else {
                i += 1
            }
        }
        return (false, User(u: "error", p: "error"))
    }
    
}

