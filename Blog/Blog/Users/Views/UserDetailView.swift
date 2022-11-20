//
//  UserDetailView.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    
    let user: User
    

    
    init(user: User) {
        self.user = user
    }
    

    
    var body: some View {
        VStack {
            NavigationLink {
                AlbumView(userId: user.id)
            } label: {
                Text("Albums")
            }
            Spacer()
            VStack {
                
                
            }
        }
        .navigationTitle(user.name)
    }

}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: 1, name: "Tibira", address: Address(geo: Geo(lat: "-37.3159", lng: "81.1496"))))
    }
}
