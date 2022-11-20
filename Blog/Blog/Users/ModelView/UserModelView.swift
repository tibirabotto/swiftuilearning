//
//  UserModelView.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import Foundation

@MainActor
class UserModelView: ObservableObject {
    
    @Published var users: [User] = []
    var url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    
    func findAll() async {
        do {
            guard let url = url else {return}
            let usersResponse = try await WebService().get(url: url, parse: { data in
                return try? JSONDecoder().decode([User].self, from: data)
            })
            self.users = usersResponse
        } catch {
        }
    }
}
