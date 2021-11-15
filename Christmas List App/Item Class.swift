//
//  Item Class.swift
//  Christmas List App
//
//  Created by Daniel Vega on 11/14/21.
//

import Foundation

public class Items: Codable {
    
    var name: String
    var link: String
    init(n: String, l: String){
        name = n
        link = l
    }
}
