//
//  Album.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

struct Album: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
}
