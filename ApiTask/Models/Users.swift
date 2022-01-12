//
//  Users.swift
//  ApiTask
//
//  Created by Mac on 07/01/22.
//

import Foundation
struct Users : Decodable {
    let id : Int
    let name : String
    let username : String
    let email : String
    let address : Address
    let phone : String
    let website : String
    let company : Company
}
