//
//  User.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/29/21.
//

import Foundation
struct User:Decodable{
    var token:String?
    var username:String?
    var first_name:String?
    var last_name:String?
    var email: String?
    var password: String?
}
