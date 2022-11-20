//
//  PhotosView.swift
//  Blog
//
//  Created by Tibirica Neto on 2022-11-15.
//

import SwiftUI

struct PhotosView: View {
    
    @StateObject var vm = PhotoViewModel()
    var albumId: Int
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                TabView {
                    ForEach(vm.photos, id: \.id) { photo in
                        AsyncImage(url: photo.url) { phase in
                            phase.image
                        }
                        .padding()
                    }
                    
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }.task {
            vm.albumId = self.albumId
            await vm.findAll()
        }
    }
    
    struct PhotosView_Previews: PreviewProvider {
        static var previews: some View {
            PhotosView(albumId: 1)
        }
    }
    
}
