//
//  CustomCell.swift
//  Christmas List App
//
//  Created by Daniel Vega on 11/14/21.
//

import Foundation
import UIKit

public class CustomCell: UITableViewCell {
    
    @IBOutlet weak var itemNameOutlet: UILabel!
    @IBOutlet weak var linkOutlet: UILabel!
    
    func configure(ine: String, lo: String) {
        itemNameOutlet.text = ine
        linkOutlet.text = lo
    }
   
    
    
    
}
