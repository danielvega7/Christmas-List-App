//
//  UserClass.swift
//  Christmas List App
//
//  Created by Daniel Vega on 10/24/21.
//

import Foundation

public class User: Codable{
    
    var userName: String
    var password: String
    var items: [Items]
    
    init(u: String, p: String, i: [Items]) {
        userName = u
        password = p
        items = i
    }
    init(u: String, p: String) {
        userName = u
        password = p
        items = [Items]()
    }
    
    
}
