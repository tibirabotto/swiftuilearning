//
//  Photo.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

struct Photo: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let url: URL
}
