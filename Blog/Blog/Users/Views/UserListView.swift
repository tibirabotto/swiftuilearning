//
//  UserListView.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var vm = UserModelView()
    
    var body: some View {
        NavigationStack {
            List(vm.users, id: \.id) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    HStack {
                        Text(user.name)
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Users")
        }
        .task {
            await vm.findAll()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
