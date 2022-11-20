//
//  User.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let address: Address
}

struct Address: Codable {
    let geo: Geo
}

struct Geo: Codable {
    var lat: String
    let lng: String
    
}


