//
//  AlbumViewModel.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

@MainActor
class AlbumViewModel: ObservableObject {
    
    @Published var albums: [Album] = []
    @Published var userId: Int?
    @Published var albumId: Int?
    
    enum EmptyError: Error {
            case isEmpty(String)
    }
    
    func findAll() async {
        do {
            guard let user_id = userId else { return }
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(user_id)/albums") else { return }
            let usersResponse = try await WebService().get(url: url, parse: { data in
                return try? JSONDecoder().decode([Album].self, from: data)
            })
            self.albums = usersResponse
        } catch {
        }
    }
    
    func findPhotosByAlbum() async {
        
    }

}
