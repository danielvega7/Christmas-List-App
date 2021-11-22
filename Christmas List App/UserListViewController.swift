//
//  UserListViewController.swift
//  Christmas List App
//
//  Created by Daniel Vega on 10/24/21.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    let encoder = JSONEncoder()
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var itemNameOutlet: UITextField!
    
    @IBOutlet weak var linkOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        itemNameOutlet.delegate = self
        linkOutlet.delegate = self
        
        if let items = UserDefaults.standard.data(forKey: "itemArray") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Items].self, from: items){
                StaticStuff.itemArray = decoded
               
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStuff.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        let ine = StaticStuff.itemArray[indexPath.row].name
        let lo = StaticStuff.itemArray[indexPath.row].link
        cell.configure(ine: ine, lo: lo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = StaticStuff.itemArray[indexPath.row].link
        
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticStuff.itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            if let encoded = try? encoder.encode(StaticStuff.itemArray) {
                
                UserDefaults.standard.set(encoded, forKey: "itemArray")
            
        }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemNameOutlet.resignFirstResponder()
        linkOutlet.resignFirstResponder()
        return true
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Text field syntax error", message: "please revisit", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        
        if itemNameOutlet.text == "" || linkOutlet.text == "" {
            self.present(alert, animated: true)
        }
        else {
            let na = itemNameOutlet.text!
            let li = linkOutlet.text!
            StaticStuff.itemArray.append(Items(n: na, l: li))
        }
        
        tableViewOutlet.reloadData()
        
        
        
        if let encoded = try? encoder.encode(StaticStuff.itemArray) {
            
            UserDefaults.standard.set(encoded, forKey: "itemArray")
        
    }
    
}
}
