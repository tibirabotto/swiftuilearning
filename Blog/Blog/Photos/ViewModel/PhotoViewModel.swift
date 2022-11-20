//
//  PhotoViewModel.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

@MainActor
class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    @Published var albumId: Int?
    
    enum EmptyError: Error {
            case isEmpty(String)
    }
    
    func findAll() async {
        do {
            guard let albumId = albumId else { return }
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/\(albumId)/photos") else { return }
            let usersResponse = try await WebService().get(url: url, parse: { data in
                return try? JSONDecoder().decode([Photo].self, from: data)
            })
            self.photos = usersResponse
        } catch {
        }
    }

}

