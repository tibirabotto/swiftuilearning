//
//  AlbumView.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import SwiftUI

struct AlbumView: View {
    
    @StateObject var vm = AlbumViewModel()
    var userId: Int
    
    init(userId: Int) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            List(vm.albums, id: \.id) { album in
                NavigationLink {
                    PhotosView(albumId: album.id)
                } label: {
                    HStack {
                        Text(album.title)
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Albums")
        }
        .task {
            vm.userId = self.userId
            await vm.findAll()
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(userId: 1)
    }
}
